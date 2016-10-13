#!/bin/bash

yum -y install avahi wget
service avahi-daemon start
yum -y localinstall /vagrant/columnstore/mariadb*.rpm
