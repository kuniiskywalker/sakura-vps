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



