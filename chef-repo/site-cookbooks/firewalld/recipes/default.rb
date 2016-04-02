#
# Cookbook Name:: firewalld
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

service "firewalld" do
  ignore_failure true
  action [:disable, :stop]
end
