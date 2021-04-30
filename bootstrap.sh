#!/bin/bash

# Setup a suitable environment for building MariaDB from source.
# Assume that the system is Ubuntu.


set -u
set -e
set -o pipefail


apt-get update -y
apt-get install -y software-properties-common
apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'

cp /Vagrant/sources/$MARIADB_VERSION/$OS_DIR/MariaDB.list /etc/apt/sources.list.d/

apt-get update -y
apt-get build-dep -y mariadb-server

apt-get install -y \
    libjemalloc-dev \
    valgrind

echo $REPO > /x

