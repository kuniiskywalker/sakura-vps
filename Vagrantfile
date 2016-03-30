# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "opscode/centos7.0"

  config.vm.box_url = "http://opscode-vm-bento.s3.amazonaws.com/vagrant/virtualbox/opscode_centos-7.0_chef-provisionerless.box"

  # forward-agentとは
  # ホストマシンのssh-agentをログイン先のマシンからも参照できるsshの機能です。
  # これを利用することで、githubなどいろいろなところに登録されたホストマシン
  # の公開鍵を、ローカルVMからも利用することができ、開発の際に捗ります。
  config.ssh.forward_agent = true

  config.omnibus.chef_version = :latest

  config.vm.network "private_network", ip: "192.168.33.10"

  config.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=777", "fmode=777"]
  
  config.vm.provision "chef_solo" do |chef|

    chef.cookbooks_path = ["chef-repo/cookbooks", "chef-repo/site-cookbooks"]

    chef.add_recipe "yumsetup"
    chef.add_recipe "docker"
  end

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1028", "--cpus", "1"]
  end
end
