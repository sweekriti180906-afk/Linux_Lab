
---

## ✅ `starter_kit.sh`

```bash
#!/bin/bash

# Create main project structure
mkdir -p project/scripts
mkdir -p project/docs
mkdir -p project/data

# Create placeholder README.md files
touch project/README.md
touch project/scripts/README.md
touch project/docs/README.md
touch project/data/README.md

# Optional: Add basic content to the README files
echo "# Project" > project/README.md
echo "# Scripts" > project/scripts/README.md
echo "# Documentation" > project/docs/README.md
echo "# Data" > project/data/README.md

# Done
echo "Starter Kit Ready!"
```

---

### 💾 Save as:

```bash
starter_kit.sh
```

### ▶️ To run:

```bash
chmod +x starter_kit.sh
./starter_kit.sh
```

---

## 📄 `LAB_extra.md`

```markdown
# LAB_extra.md

## Purpose of Script

The purpose of `starter_kit.sh` is to automatically set up a starter folder structure for a typical devcreenshots/Screenshot from 2025-09-10 16-56-23.pngelopment project. This helps teams quickly begin work without manually creating directories and files.

![Alt text](Linux_Lab/assignments/ss.png)


```

\$ ./starter\_kit.sh
Starter Kit Ready!

```

Then the structure will look like:

```

project/
├── 
README.md


├── scripts/
│  
 └── README.md


├── docs/
│   
└── README.md


└── data/

└── README.md

````

## Extra Questions

### What does `mkdir -p` do?

The `mkdir -p` command creates directories **recursively** and **avoids errors if the directory already exists**. For example:

```bash
mkdir -p project/scripts
````

This will:

* Create the `project` directory if it doesn't exist.
* Then create the `scripts` directory inside it.
* Do nothing if they already exist.

This makes it ideal for automation.

### Why is automation useful in DevOps?

Automation in DevOps is essential because it:

* **Saves time**: Repetitive tasks are handled instantly.
* **Reduces human error**: Scripts ensure consistency.
* **Improves scalability**: You can deploy the same setup across many environments.
* **Supports CI/CD**: Automation is the backbone of continuous integration and deployment.
* **Enables fast onboarding**: New team members can get started quickly with automated environments.

```

---

