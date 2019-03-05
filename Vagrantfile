# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

dir = File.dirname(File.expand_path(__FILE__))
conf = YAML.load_file("#{dir}/config.yaml")

Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # https://docs.vagrantup.com.

  config.vm.box = "ubuntu/bionic64"
  ####################################
  # VirtualBox Setting
  config.vm.provider "virtualbox" do |vb|
    vb.gui    = conf["vms"]["gui"]
    vb.memory = conf["vms"]["ram"]
    vb.cpus   = conf["vms"]["cpus"]
    vb.name   = conf["vms"]["name"]
  end

  ####################################
  # 네트워크 설정
  if conf["public_network"]["use"] == "true"
    if conf["public_network"]["ip"] == "auto"
      config.vm.network "public_network"
    else
      config.vm.network "public_network", 
        ip: conf["public_network"]["ip"]
    end
  else
    if conf["private_network"]["ip"] == "auto"
      config.vm.network "private_network"
    else
      config.vm.network "private_network",
        ip: conf["private_network"]["ip"]
    end
  end

  ####################################
  # Port forward
  conf["ports"].each do |port|
    config.vm.network "forwarded_port",
      guest: port["guest"] ,
      host: port["host"]
  end

  ####################################
  # Sync Folder
  conf["syncFolders"].each do |share|
    if share["type"] == "smb"
      config.vm.synced_folder share["host"], 
        share["guest"], 
        type: share["type"],
        smb_username: share["smb_username"],
        smb_password: share["smb_password"]
    else
      config.vm.synced_folder share["host"], share["guest"]
    end
  end

  ####################################
  # Provision
  config.vm.provision "file",
    source: "scripts/bash_profiles.sh",
    destination: "$HOME/.bash_profiles"

  # HostName Change
  config.vm.provision :shell,
    inline: "sudo sysctl kernel.hostname=#{conf["vms"]["name"]}"

  # Provision setting by files
  conf["scriptFiles"].each do |sf|
    # puts "scripts/#{sf}.sh"
    config.vm.provision :shell, 
      privileged: false, 
      path: "scripts/#{sf["file"]}.sh",
      args: sf["args"]
  end

end
