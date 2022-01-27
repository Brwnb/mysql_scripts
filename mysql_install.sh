#!/usr/bin/env bash

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

test -f mysql*.deb && echo "Não Precisa fazer download" && sleep 5 || \
	wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb

chmod +x mysql*.deb
dpkg -i mysql*deb

apt-get update && apt-get install mysql-server -y


