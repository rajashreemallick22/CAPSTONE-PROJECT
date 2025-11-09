# 🛠️ System Maintenance Suite – Bash Scripting Project  
---

## 🧾 Overview  
This project is a collection of **Bash scripts** designed to automate essential **system maintenance tasks** such as backups, updates, log monitoring, and error handling.  
All scripts can be executed **individually** or via a **menu-driven interface** for convenience and centralized management.

---

## 💻 How to Install Ubuntu Terminal in Windows Using Command Prompt  

### ⚙️ Step-by-Step Installation  

#### 🪟 1. Open Command Prompt as Administrator  
- Press **Windows + S**, type **cmd**  
- Right-click **Command Prompt → Run as administrator**

#### 🧩 2. Enable Windows Subsystem for Linux (WSL)  
Run the following command:
```bash
wsl --install
```

✅ This command will:

- Enable Windows Subsystem for Linux (WSL)
- Install Ubuntu (latest LTS version) automatically
- Set up the Virtual Machine Platform


🔁 3. Restart Your Computer

- After installation, restart your PC when prompted.

👤 4. Set Up Ubuntu

- Ubuntu will launch automatically after reboot.
- Create a UNIX username and password when asked.
- Once setup completes, you can start using the Ubuntu terminal.

🧠 (Optional) Install a Specific Ubuntu Version

Example for Ubuntu 22.04:
``` bash
wsl --install -d Ubuntu-22.04
```
📜 (Optional) View Available Linux Distributions
``` bash
wsl --list --online
```
🚀 Launch Ubuntu Anytime

You can start Ubuntu by typing one of the following commands:
```bash
ubuntu
```

or
```bash
wsl
```
---

## 📁 Files Included

| 🗂️ File Name | 📄 Description |
|--------------|----------------|
| **CONFIG.sh** |  Contains configuration variables for directories, backup retention, and log file paths. |
| **BACKUP.sh** |  Automates system backups by compressing a specified directory and storing it safely. |
| **UPDATE_CLEANUP.sh** | Updates system packages, removes unused dependencies, and clears cache files. |
| **LOG_MONITOR.sh** | Monitors log files (e.g., /var/log/syslog, /var/log/auth.log) for errors or warnings. |
| **MENU.sh** | The main menu-driven script that integrates all functionalities and logs each operation. |
| **maintenance.log** | Auto-generated log file recording all operations and errors from the suite. |

---

## 🖥️ How to Run
1. Open Ubuntu (WSL or Linux)

Launch the Ubuntu terminal from Windows Start Menu or use:
``` bash
wsl
```
2. Navigate to the Project Folder
```bash
cd ~/CAPSTONE/BASH_SUITE
```
3. Grant Execute Permissions
``` bash
chmod +x *.sh
```
4. Run the Main Script
```bash
./MENU.sh
```
5. Select Desired Operation
📦 Run Backup  
🔄 Update & Clean System  
🧾 Monitor Logs  
📘 View Log File  
❌ Exit  

---

## 🌟 Features

✅ Automated system backups  
✅ System updates and cleanup  
✅ Real-time log monitoring  
✅ Interactive menu-driven interface  
✅ Error handling with exit codes  
✅ Centralized operation logging (`maintenance.log`)

---

## 👨‍💻 Author
**Rajaqshree Mallick**  
🎓 B.Tech (CSE), ITER, Siksha ’O’ Anusandhan University
