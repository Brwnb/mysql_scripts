#!/usr/bin/env bash

# date 2022-01-28
#

#################################################
# This file is the same that mysql_install.sha  #               
# I create this just for fun                    #
#################################################

# This scritp works with Debian 10 and Debian 11 with mysql 8
# Probably works with ubuntu I didn't check

# REPO released at 2022/29/01

repo=https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
repofile=mysql-apt-config_0.8.22-1_all.deb

# It is necessary to update the variable path
export PATH=$PATH:/usr/local/sbin:/sbin:/usr/sbin:/sbin


clear
if [[ -e /usr/bin/apt ]]; then
	apt update && apt upgrade -y
else
	echo "The system isn't debian based"
	echo "The script just can used in debian based distros"
	exit 1
fi

sleep 5
clear

apt install gnupg wget lsb-release -y

sleep 5
clear

if [[ -d /tmp/mysql_temp ]]; then
	echo "It isn't necessary to create a directory"
       	sleep 5
else
	mkdir /tmp/mysql_temp
	echo "Making a mysql_temp directory"
	sleep 5
fi


cd /tmp/mysql_temp

pwd
sleep 5

# Link got in the official site
# https://dev.mysql.com/downloads/repo/apt/

echo "Checking if the repo file exist"
if [[ -e $repofile ]]; then
       echo "The file exist. It isn't necessary to do another download file" 
       	sleep 5
else
	echo "Download the repo file"
       	wget "$repo"
fi

chmod +x mysql*.deb
echo "Installing the mysql repo"
sleep 5
dpkg -i mysql*deb

echo "installing mysql server"
sleep 5
apt-get update && apt-get install mysql-server -y

clear
echo
echo
echo " Is the mysql enabled? : $(systemctl is-enabled mysql)"
echo
echo

systemctl status mysql
echo
echo "Works as expected!!!"
echo
