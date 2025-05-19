# 🧰 Break-Fix Linux Troubleshooting Simulator

A hands-on Docker-based Linux environment filled with intentional system issues — designed to showcase IT troubleshooting, Linux debugging, and sysadmin skills. Perfect for portfolio projects, interview prep, or teaching.

---

## 🚀 Project Purpose

This simulator replicates real-world production problems for you to identify, debug, and resolve using common tools (`htop`, `ps`, `journalctl`, `cron`, etc.).

Ideal for:
- IT support engineers
- System administrators
- DevOps learners
- Job candidates preparing for hands-on interviews

---

## 🧱 Injected Issues

This environment includes **5 pre-configured system failures**:

1. 🔐 SSH login is broken due to bad `.ssh` permissions  
2. ⚠️ Apache fails to start because of an invalid config  
3. 💾 Disk space full (`/tmp` filled with junk files)  
4. 🧠 Rogue process hogs CPU (`yes > /dev/null &`)  
5. 📉 Cron job spams logs to `/var/log/broken.log`  

Each issue can be resolved with basic Linux skills.

---

## 🛠️ How to Use

### Build the container:
```bash
docker build -t break-fix .
Run the simulator:
bash
Copy code
docker run -it break-fix
You’ll be dropped into a broken Linux environment. Use your skills to investigate and repair the system.

🧪 Tools You Might Use
htop, ps aux, top

systemctl, journalctl, apachectl

df -h, du -sh *, rm, nano

crontab, tail -f /var/log/broken.log

chmod, chown, kill, pkill

📝 Solutions
For a full walkthrough of how to fix each issue, see solutions.md

✍️ Author
Amber Rasmussen
https://github.com/elevelin
