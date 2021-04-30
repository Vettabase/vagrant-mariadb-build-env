# vagrant-mariadb-build-env

A Vagrantfile to create suitable VMs to compile MariaDB.


## Configuration

You can pass these variables:

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
BOX=ubuntu/bionic64
MARIADB_VERSION=10.6
REPO=~/repos/server
```

Note: this wouldn't work with any Vagrantfile, but we automatically install
the `vagrant-env` plugin.


## Copyright and Contacts

This repository is distributed under the terms of the GNU AGPL, version 3. Copyright: Vettabase Ltd.

To contact us:

- info@vettabase.com
- https://vettabase.com

