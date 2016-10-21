#!/bin/bash

yum -y install avahi wget sudo net-tools
service avahi-daemon start
yum -y localinstall /vagrant/columnstore/mariadb*.rpm

# run postConfigure with default settings for single server
/bin/echo -e "1\ncolumnstore-1\n1\n1\n" | /usr/local/mariadb/columnstore/bin/postConfigure

# enable root access in mariadb from host
/usr/local/mariadb/columnstore/mysql/bin/mysql --defaults-file=/usr/local/mariadb/columnstore/mysql/my.cnf -uroot -vvv -Bse "set sql_mode=NO_ENGINE_SUBSTITUTION;GRANT ALL ON *.* to root@'%';FLUSH PRIVILEGES;"

# setup cross engine join support
/usr/local/mariadb/columnstore/bin/setConfig CrossEngineSupport Host 127.0.0.1
/usr/local/mariadb/columnstore/bin/setConfig CrossEngineSupport Port 3306
/usr/local/mariadb/columnstore/bin/setConfig CrossEngineSupport User root
/usr/local/mariadb/columnstore/bin/setConfig CrossEngineSupport Password ""
/usr/local/mariadb/columnstore/bin/mcsadmin restartsystem y

