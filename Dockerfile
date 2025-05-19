FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y openssh-server apache2 cron curl htop sudo && \
    useradd -m troubleshoot && echo "troubleshoot:fixme" | chpasswd && \
    mkdir /var/run/sshd && \
    echo 'troubleshoot ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Inject break-fix issues
COPY inject_issues.sh /inject_issues.sh
RUN chmod +x /inject_issues.sh && /inject_issues.sh

CMD ["/bin/bash"]
