#!/bin/bash

# A robust script to provision a secure, restricted application user.
# Features: Restricted shell (SFTP + one command), SSH key injection with
# security options, POSIX ACLs for directory access, safe sudoers rules,
# password policy enforcement, and optional SFTP chroot.

set -euo pipefail

# --- Configuration ---
# You can change the default home directory base here.
DEFAULT_HOME_BASE="/home"
# The single whitelisted command for the user.
WHITELISTED_COMMAND="/usr/local/bin/run_app"

# --- Script Functions ---

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Provisions a new application user with a restricted environment.
This script must be run as root.

Required Arguments:
  --project <name>         Project name, used for user/group names (e.g., 'myapp').
  --ssh-keys-file <path>   Path to a file containing public SSH keys (one per line).
  --allowed-ips <cidr>     Comma-separated list of source CIDRs for SSH access (e.g., '192.168.1.0/24,10.0.0.5/32').

Optional Arguments:
  --home-dir <path>        Specify a custom home directory. (Default: /home/appsvc_<project>)
  --password <pass>        Set a password for the user. Must meet policy.
  --no-password            Create the user with a locked password (SSH key only). This is the default.
  --force                  Overwrite existing user/group/configs if they exist.
  --chroot-sftp            (Bonus) Configure a chroot jail for SFTP access.
  -h, --help               Show this help message.
EOF
    exit 1
}

# Helper function for logging
log() {
    echo "[INFO] $1"
}

# Helper function for errors
error() {
    echo "[ERROR] $1" >&2
    exit 1
}

# Check for required commands
check_dependencies() {
    log "Checking for dependencies..."
    command -v setfacl >/dev/null 2>&1 || error "The 'setfacl' command is not found. Please install the 'acl' package."
    command -v visudo >/dev/null 2>&1 || error "The 'visudo' command is not found. Please install the 'sudo' package."
}

# Validate password against the policy
validate_password() {
    local pass="$1"
    if (( ${#pass} < 12 )); then
        error "Password must be at least 12 characters long."
    fi
    if ! [[ "$pass" =~ [A-Z] ]]; then
        error "Password must contain at least one uppercase letter."
    fi
    if ! [[ "$pass" =~ [a-z] ]]; then
        error "Password must contain at least one lowercase letter."
    fi
    if ! [[ "$pass" =~ [0-9] ]]; then
        error "Password must contain at least one digit."
    fi
    if ! [[ "$pass" =~ [^a-zA-Z0-9] ]]; then
        error "Password must contain at least one special symbol."
    fi
}

# --- Main Logic ---

main() {
    # --- Argument Parsing ---
    PROJECT=""
    SSH_KEYS_FILE=""
    ALLOWED_IPS=""
    HOME_DIR=""
    PASSWORD=""
    NO_PASSWORD=true
    FORCE=false
    CHROOT_SFTP=false

    while [[ $# -gt 0 ]]; do
        case "$1" in
            --project) PROJECT="$2"; shift 2 ;;
            --ssh-keys-file) SSH_KEYS_FILE="$2"; shift 2 ;;
            --allowed-ips) ALLOWED_IPS="$2"; shift 2 ;;
            --home-dir) HOME_DIR="$2"; shift 2 ;;
            --password) PASSWORD="$2"; NO_PASSWORD=false; shift 2 ;;
            --no-password) NO_PASSWORD=true; shift ;;
            --force) FORCE=true; shift ;;
            --chroot-sftp) CHROOT_SFTP=true; shift ;;
            -h|--help) usage ;;
            *) error "Unknown option: $1" ;;
        esac
    done

    # --- Input Validation ---
    if [ -z "$PROJECT" ] || [ -z "$SSH_KEYS_FILE" ] || [ -z "$ALLOWED_IPS" ]; then
        echo "[ERROR] Missing required arguments."
        usage
    fi
    
    if [[ $EUID -ne 0 ]]; then
        error "This script must be run as root."
    fi

    if [ ! -f "$SSH_KEYS_FILE" ]; then
        error "SSH keys file not found: $SSH_KEYS_FILE"
    fi

    # --- Variable Setup ---
    USERNAME="appsvc_${PROJECT}"
    GROUPNAME="appgrp_${PROJECT}"
    APP_DIR="/srv/apps/${PROJECT}"
    HOME_DIR="${HOME_DIR:-${DEFAULT_HOME_BASE}/${USERNAME}}"
    SUDOERS_FILE="/etc/sudoers.d/90-${USERNAME}"

    log "Starting provisioning for project: $PROJECT"
    log "User: $USERNAME | Group: $GROUPNAME"
    log "App Directory: $APP_DIR"
    log "Home Directory: $HOME_DIR"
