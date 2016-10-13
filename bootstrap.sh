#!/bin/bash

yum -y install avahi wget
service avahi-daemon start
wget "https://www.dropbox.com/s/ljx19r3mgbw7umh/dbt3.tar.gz?dl=0" --progress=dot:giga -O dbt3.tar.gz
mkdir dbt3
cd dbt3
tar -zxvf ../dbt3.tar.gz
yum -y localinstall /vagrant/columnstore/mariadb*.rpm
