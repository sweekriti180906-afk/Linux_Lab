🌲 1. Show Processes (ps aux)

Command:

ps aux


a → show processes of all users

u → show user/owner of process

x → show processes not attached to a terminal


Example Output:

---

![img](<Screenshot from 2025-09-29 11-36-29.png>)

![img](<Screenshot from 2025-09-29 11-37-02.png>)

![img](<Screenshot from 2025-09-29 11-37-39.png>)

---

🌳 2. Process Tree (pstree)

Command:

pstree -p

Example Output:
***
![img](<Screenshot from 2025-09-29 11-37-50.png>)

!![img](<Screenshot from 2025-09-29 11-38-03.png>)

![img](<Screenshot from 2025-09-29 11-38-15.png>)

![img](<Screenshot from 2025-09-29 11-38-25.png>)

![img](<Screenshot from 2025-09-29 11-38-32.png>)




***
👉 Shows parent–child process hierarchy.


---

📊 3. Real-Time Monitoring (top)

Command:

top

 Output:    
    ***

   ![img](<Screenshot from 2025-09-29 11-39-26-2.png>)


![img](<Screenshot from 2025-09-29 11-39-46.png>)

  ***
  
👉 Press q to quit.


---

⚡ 4. Process Priority (nice, renice)

Command:

nice -n 10 sleep 300 &

renice -n -5 -p 3050

Output:
***

![img](<Screenshot from 2025-09-29 11-40-05.png>)

***
---

🔧 5. CPU Affinity (taskset)

Commands:
taskset -cp 5553

taskset -cp 1 5553

Outpur:
***
![img](<Screenshot from 2025-09-29 11-40-21.png>)

***
---

📂 6. I/O Priority (ionice)

Commands:

ionice -c 3 -p 3050

successfully set pid 3050's IO scheduling class to idle
---
![img](<Screenshot from 2025-09-29 11-40-52-2.png>)

---

📑 7. File Descriptors (lsof)

Show first 5 descriptors:

lsof -p 5553 | head -5

Output:
***
![img](<Screenshot from 2025-09-29 11-40-52-1.png>)

***
---

🐛 8. Trace Syscalls (strace)

Attach to PID:

strace -p 5553

strace: Process 5553 attached
restart_syscall(<... resuming interrupted nanosleep ...>) = 0
nanosleep({tv_sec=300, tv_nsec=0}, 0x7ffd4a60d8b0) = ? ERESTART_RESTARTBLOCK (Interrupted by signal)



---

📡 9. Find Port Usage (fuser)

Check which process uses port 8080:

sudo fuser -n tcp 8080

8080/tcp:           4321



---

📊 10. Per-Process Stats (pidstat)

Monitor CPU every 2 sec, 3 times:

pidstat -p 5553 2 3

 OUTPUT
 ***
 ![img](<Screenshot from 2025-09-29 11-41-07.png>)

***
---
🔐 11. Control Groups (cgroups)

Create cgroup:

sudo cgcreate -g cpu,memory:/testgroup

![img](<Screenshot from 2025-09-29 11-41-23.png>)


COMMANDS:
echo "50000  100000"| sudo tee /sys/fs/cgroup/cpu/testgroup/cpu.cfs_quota_us
echo 100M   | sudo tee /sys/fs/cgroup/memory/testgroup/memory.limit_in_bytes

Add process (PID 3050):

echo 5553 | sudo tee /sys/fs/cgroup/cpu/testgroup/cgroup.procs

Output:
***
![img](<Screenshot from 2025-09-29 11-41-48.png>)
***

---
