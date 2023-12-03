#!/bin/bash

# - COLORS - #
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
BLUE='\033[1;36m'
NONE='\033[0m'

# - MAIN - #
echo -e "${GREEN}|START| Start basic setup..${NONE}\n"
sleep 5s
echo -e "${YELLOW}|No.1| APT Updating & Install required packages.${NONE}\n"
sed -i "5,6s/^/# /g" /etc/apt/sources.list
apt install -y vim net-tools dnsutils tcpdump curl lynx wget ssh tcptraceroute traceroute nfs-common smbclient psmisc sudo
sed -i "s/\"syntax on/syntax on\nset number\nset ignorecase/g" /etc/vim/vimrc
sleep 3s
echo -e "${YELLOW}|No.2| Add /etc/resolv.conf${NONE}\n"
echo "nameserver 127.0.0.1" > /etc/resolv.conf
sleep 3s
echo -e "${YELLOW}|No.3| Enable to port forwarding.${NONE}\n"
sed -i "28s/^#//g" /etc/sysctl.conf
sed -i "35s/^#//g" /etc/sysctl.conf
sysctl -p
sleep 3s
echo -e "${YELLOW}|No.4| Setting for /etc/ssh/sshd_config${NONE}\n"
sed -i "s/#Port/Port/g" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#Banner none/Banner \/etc\/issue/g" /etc/ssh/sshd_config
systemctl restart sshd
sleep 3s
echo -e "${YELLOW}|No.5| Configure banner & motd.${NONE}\n"
cat /dev/null > /etc/issue
echo -e "\nWelcome to Linux Environments (IT Network Systems Administration)\n" > /etc/issue
cp /etc/motd /etc/motd.bak
cat /dev/null > /etc/motd
sleep 3s
echo -e "${YELLOW}|No.6| Configure timezone to Asia/Seoul${NONE}\n"
timedatectl set-timezone Asia/Seoul
hwclock -w
timedatectl status
sleep 3s
echo -e "${YELLOW} Almost done . . . ${NONE}\n"
sleep 5s
echo -e "${GREEN}|Finished| Complete Setup!${NONE}\n"
# - - - #
