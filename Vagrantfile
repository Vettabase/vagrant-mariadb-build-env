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

    VM_HOTPLUG = ENV['VM_HOTPLUG'] || 'on'
    VM_CPU = ENV['VM_CPU'] || '2'
    VM_RAM = ENV['VM_RAM'] || 1024 * 4
    VM_VRAM = ENV['VM_VRAM'] || '2'

    config.vm.box = BOX
    config.vm.box_check_update = false
    config.vm.synced_folder '.', '/Vagrant'

    config.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.customize ['modifyvm', :id, '--memory', VM_RAM]
        vb.customize ['modifyvm', :id, '--cpuhotplug', VM_HOTPLUG]
        vb.customize ['modifyvm', :id, '--cpus', VM_CPU]
        vb.customize ['modifyvm', :id, '--vram', VM_VRAM]
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

