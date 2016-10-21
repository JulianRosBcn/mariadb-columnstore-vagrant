# MariaDB ColumnStore Vagrant Setup

## Introduction

This setup is designed to create a basic single-server MariaDB ColumnStore setup on your local machine as easily as possible. It will create a CentOS 7 virtual machine with ColumnStore installed.

## Requirements

You need the following things to make this work:

* A computer with a 64bit OS, CPU virtualization extensions enabled in the BIOS and minimum 6GB RAM (the VM will use 4GB)
* An internet connection
* [Vagrant](https://www.vagrantup.com/downloads.html)
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* This git tree
* The MariaDB ColumnStore RPMS (minimum of version 1.0.4 required)
* ColumnStore compatible DBT3 1G data file from https://www.dropbox.com/s/ljx19r3mgbw7umh/dbt3.tar.gz

## Installing

1. Install Vagrant and VirtualBox into your OS of choice, if you are using Linux and are using the repository version of Vagrant you may need to install the libvirt plugin for Vagrant (typically called vagrant-libvirt).
2. For windows ensure you have a tool to manage tar.gz files such as 7-zip(http://www.7-zip.org/). In addition an ssh client is needed by vagrant (https://www.mls-software.com/opensshd.html, no need to install the server)
3. Install the virtualbox guest addditions plugin: 

    ````
    vagrant plugin install vagrant-vbguest
    ```

4. Get the ColumnStore CentOS 7 RPMs and put them in the `columnstore` subdirectory of this tree (*note*: these need be extracted from the `.tar.gz` in this directory)
5. Get dbt3.tar.gz as indicated in the requirements and put it in the `dbt3` subdirectory of this tree
6. Run `vagrant up` (this step may take some time). Note that if you get an error about "libvirt" use `vagrant up --provider=virtualbox` instead.

You should now have a VM running with ColumnStore installed

## Running ColumnStore
ColumnStore can be accessed either through shell access in the vm:
```
vagrant ssh
sudo su -
mcsadmin
```

Alternatively the 3306 port is forwarded to the host and can be connected to using any sql tool on host localhost, port 3306, userid root, no password by default.


## Other Commands

These are several useful Vagrant commands that can be run from this directory, please see the Vagrant manual for more information:

* To suspend the machine: `vagrant suspend`
* To resume a suspended machine: `vagrant resume`
* To destroy the machine: `vagrant destroy`

You can use `vagrant ssh` to log back into a machine at any time.
