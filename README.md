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

