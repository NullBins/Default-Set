#!/bin/bash

# - COLORS - #
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'

# - MAIN - #
echo -e "${BLUE}|START| Start basic setup.."
sleep 5s
echo -e "${GREEN}|No.1| APT Updating & Install required packages."
sed -i "5,6s/^/# /g" /etc/apt/sources.list
apt update -y
apt install -y vim net-tools dnsutils tcpdump curl lynx wget ssh tcptraceroute traceroute nfs-common smbclient psmisc sudo
sed -i "s/\"syntax on/syntax on\nset number\nset ignorecase/g" /etc/vim/vimrc
echo -e "${GREEN}|No.2| Add /etc/resolv.conf"
echo "nameserver 127.0.0.1" > /etc/resolv.conf
echo -e "${GREEN}|No.3| Enable to port forwarding."
sed -i "28s/^#//g" /etc/sysctl.conf
sed -i "33s/^#//g" /etc/sysctl.conf
sysctl -p
echo -e "${GREEN}|No.4| Setting for /etc/ssh/sshd_config"
sed -i "s/#Port/Port/g" /etc/ssh/sshd_config
sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
sed -i "s/#Banner none/Banner \/etc\/issue/g" /etc/ssh/sshd_config
systemctl restart sshd
echo -e "${GREEN}|No.5| Configure banner & motd."
cat /dev/null > /etc/issue
echo -e "\nWelcome to Linux Environments (IT Network Systems Administration)\n" > /etc/issue
cp /etc/motd /etc/motd.bak
cat /dev/null > /etc/motd
echo -e "${GREEN}|No.6| Configure timezone to Asia/Seoul"
timedatectl set-timezone Asia/Seoul
hwclock -w
timedatectl status
echo -e "${BLUE}|Finished| Complete Setup!"