# vagrant-mariadb-build-env

A Vagrantfile to create suitable VMs to compile MariaDB.

You should have the MariaDB source repository on your host system, which should be pulled
with git, and you should work on it with your favourite tools. The repository directory
should be a shared folder (see the `REPO` variable below). The VM will be able
to access it too, to compile MariaDB.


## Configuration

You can pass these variables:

* `VM_HOTPLUG`: Wether hotplug should be ON or OFF for the VM. Default: 'on'.
* `VM_CPU`: Number of vCPU's in the VM. Default: 2.
* `VM_RAM`: Amount of RAM in M. Default: 4G.
* `VM_VRAM`: Amount of video-RAM in M. Default: 4.
* `BOX`: The name of the base box (the VM operating system). Default: 10.6.
* `MARIADB_VERSION`: The MariaDB version you will compile. Default:
  'ubuntu/bionic64'.
* `REPO` (optional): The path of the MariaDB source repository. It will be a shared folder,
  and will be reachable under `/repo` in the VM. Default: ''.

The VM installs the build dependencies from MariaDB official repositories.
To do so, it needs a MariaDB.list file that defined those repositories for the operating
system and the MariaDB version in use.
The MariaDB.list file is expected to be in the following path:

```
sources/normalised_os/mariadb_version/
```

`normalised_os` is the name of the box, where the `/` character is replaced with `-`.

The easiest way to set these variables is to create a `.env` file. En example:

```
BOX=ubuntu/focal64
MARIADB_VERSION=10.6
REPO=~/repos/server
```

Note: this wouldn't work with any Vagrantfile, but we automatically install
the `vagrant-env` plugin.

### Supported versions lists

Here is a list of supported MariaDB versions and, for each of them, the sublist of
supported systems.

#### 10.6

* ubuntu/focal64 (Ubuntu 20.04)
* ubuntu/bionic64 (Ubuntu 18.04)

#### 10.5

* ubuntu/focal64 (Ubuntu 20.04)
* ubuntu/bionic64 (Ubuntu 18.04)
* ubuntu/xenial64 (Ubuntu 16.04)


## Build script

Once the VM is built, in the `/Vagrant` directory you will find the `build-mariadb.sh` file,
that builds MariaDB with the default options. Modify it according to your needs.


## Copyright and Contacts

This repository is distributed under the terms of the GNU AGPL, version 3. Copyright: Vettabase Ltd.

To contact us:

- info@vettabase.com
- https://vettabase.com

