#!/bin/bash

# Break SSH by setting wrong permissions
mkdir -p /home/troubleshoot/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC...' > /home/troubleshoot/.ssh/authorized_keys
chmod 777 /home/troubleshoot/.ssh
chmod 666 /home/troubleshoot/.ssh/authorized_keys

# Break Apache config
echo 'INVALID_CONFIG' > /etc/apache2/sites-enabled/000-default.conf

# Fill disk space
fallocate -l 950M /tmp/filler1 || true
fallocate -l 950M /tmp/filler2 || true

# CPU hog
echo 'yes > /dev/null &' >> /root/.bashrc

# Broken cron job
echo '* * * * * root echo "fail" >> /var/log/broken.log' > /etc/cron.d/broken
chmod 0644 /etc/cron.d/broken

# Add clues
cat <<EOF > /root/README.md
Welcome to the Break-Fix Simulator. Fix the following:
1. SSH login is broken
2. Apache won't start
3. Disk is full
4. High CPU
5. Cron is spamming or failing

Good luck!
EOF

