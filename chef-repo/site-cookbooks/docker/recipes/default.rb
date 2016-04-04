#
# Cookbook Name:: docker
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "docker.repo" do
  owner  "root"
  group  "root"
  path   "/etc/yum.repos.d/docker.repo"
  mode   "0644"
end

package "docker-engine" do
  action :install
end

service "docker" do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end

dockercompose_install_url ="https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m`"

execute "install docker-compose" do
  not_if { File.exists?("/usr/local/bin/docker-compose") }
  command <<-EOH
    curl -L #{dockercompose_install_url} > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
  EOH
  action :run
end

