# -*- mode: ruby -*-
# vi: set ft=ruby :


# this Vagrantfile is tested with this Vagrant version,
# fail if an older version is used
Vagrant.require_version '>= 2.2.14'

Vagrant.configure('2') do |config|
    # read variables from .env if vagrant-env plugin is installed
    config.vagrant.plugins = [ 'vagrant-env' ]
    config.env.enable

    # defaults
    BOX = ENV['BOX'] || 'ubuntu/bionic64'
    MARIADB_VERSION = ENV['MARIADB_VERSION'] || '10.6'
    REPO = ENV['REPO'] || ''

    config.vm.box = BOX
    config.vm.box_check_update = false
    config.vm.synced_folder '.', '/Vagrant'

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.customize ['modifyvm', :id, '--memory', 1024 * 4]
        vb.customize ['modifyvm', :id, '--cpuhotplug', 'on']
        vb.customize ['modifyvm', :id, '--cpus', '2']
        vb.customize ['modifyvm', :id, '--vram', '2']
    end

    # default synced folder
    config.vm.synced_folder '.', '/Vagrant'
    # optional synced folder that should point to a MariaDB source repository
    unless REPO.nil?
        config.vm.synced_folder REPO, '/repo'
    end

    # For the box name to be usable as a directory name,
    # we're replacing / with -
    BOX_NORMALISED = BOX.gsub('/', '-')

    config.vm.provision :shell,
        path: 'bootstrap.sh',
        env: { 'OS_DIR' => BOX_NORMALISED, 'MARIADB_VERSION' => MARIADB_VERSION, 'REPO' => REPO }
end

