# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos7.1"

  config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.1/vagrant-centos-7.1.box"

  # Available use private key of host os on guest oss
  config.ssh.forward_agent = true

  config.omnibus.chef_version = :latest

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=777", "fmode=777"]

  # config.vm.provision :shell, :path => "bootstrap.sh"
  
  config.vm.provision "chef_solo" do |chef|

    chef.cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]

    chef.add_recipe "yumsetup"
    chef.add_recipe "docker"
    chef.add_recipe "selinux"
    chef.add_recipe "git"
    chef.add_recipe "firewalld"
    chef.add_recipe "sudo"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1028", "--cpus", "1"]
  end
end
