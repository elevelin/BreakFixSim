✅ Solutions to Break-Fix Linux Troubleshooting Simulator

This document explains how to identify and resolve each issue injected into the simulator.

---

1. 🔐 SSH Login is Broken
**Problem:** The `.ssh` directory and `authorized_keys` file have incorrect permissions.

**Symptoms:**
- SSH fails silently or gives a "Permission denied" error
- `~/.ssh` permissions are too open

**Fix:**
```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```
2. ⚠️ Apache Won’t Start
Problem: The default Apache config file contains invalid syntax (INVALID_CONFIG placeholder).

Symptoms:

Apache fails to start (systemctl status apache2 shows errors)

Running apachectl configtest fails

Fix:
```bash
nano /etc/apache2/sites-enabled/000-default.conf
# Replace invalid content with valid configuration

# Example:
<VirtualHost *:80>
    DocumentRoot /var/www/html
</VirtualHost>

# Then run:
apachectl configtest
systemctl restart apache2
```
3. 💾 Disk is Full
Problem: Large junk files were created in /tmp using fallocate.

Symptoms:

df -h shows /tmp or / at 100%

Services crash or can't write to disk

Fix:
```bash
rm /tmp/filler1 /tmp/filler2
df -h
```
4. 🧠 High CPU Usage
Problem: A yes > /dev/null & process is running in the background.

Symptoms:

High CPU usage in htop or top

Fans spinning loudly or container slowing down

Fix:
```bash
ps aux | grep yes
kill PID
# Or more aggressively:
pkill yes
```
5. 📉 Cron Job Spamming Logs
Problem: A cron job is writing to /var/log/broken.log every minute.

Symptoms:

File /var/log/broken.log grows rapidly

tail -f /var/log/broken.log shows repeated "fail" entries

Fix:
```bash
rm /etc/cron.d/broken
systemctl restart cron
```
📝 Final Note
Document your resolution steps like a support ticket:

What you found

What commands you ran

How you validated the fix

This shows you can troubleshoot independently and communicate clearly — essential for IT support roles.
