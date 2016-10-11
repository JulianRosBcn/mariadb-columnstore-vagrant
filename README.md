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

## Installing

1. Install Vagrant and VirtualBox into your OS of choice, if you are using Linux and are using the repository version of Vagrant you may need to install the libvirt plugin for Vagrant (typically called vagrant-libvirt).
2. Get the ColumnStore CentOS 7 RPMs and put them in the `columnstore` subdirectory of this tree
3. Run `vagrant up` (this step may take some time)

You should now have a VM running with ColumnStore installed

## Running ColumnStore

This Vagrant file does not start ColumnStore, to do so please do the following from this git directory:

```bash
vagrant ssh
/usr/local/mariadb/columnstore/bin/postConfigure
```

Select option `1` at the first prompt and then hit enter for the rest of the prompts.

You are now inside the virtual machine with ColumnStore running.

## Other Commands

These are several useful Vagrant commands that can be run from this directory, please see the Vagrant manual for more information:

* To suspend the machine: `vagrant suspend`
* To resume a suspended machine: `vagrant resume`
* To destroy the machine: `vagrant destroy`

You can use `vagrant ssh` to log back into a machine at any time.
