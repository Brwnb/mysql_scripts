#!/usr/bin/env bash

# date 2022-01-28
#

# This scritp works with Debian 10 and Debian 11 with mysql 8
# Probably works with ubuntu I didn't check

export PATH=$PATH:/usr/local/sbin:/sbin:/usr/sbin:/sbin

clear
apt update && apt upgrade -y

sleep 5
clear

apt install gnupg wget lsb-release -y

sleep 5
clear

test -d /tmp/mysql_temp && echo "Não será necessário criar o diretório" && \
       	sleep 5 || mkdir /tmp/mysql_temp

cd /tmp/mysql_temp

pwd
sleep 5

# Link get in the official site
# https://dev.mysql.com/downloads/repo/apt/

test -f mysql*.deb && echo "Não Precisa fazer download" && sleep 5 || \
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb

chmod +x mysql*.deb
dpkg -i mysql*deb

apt-get update && apt-get install mysql-server -y

clear

echo " Is the mysql enabled? : $(systemctl is-enabled mysql)"
systemctl status mysql
echo "Works as expected!!!"
