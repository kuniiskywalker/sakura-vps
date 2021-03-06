#
# Cookbook Name:: ntpd
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
package 'ntp' do
  action :install
end

template "/etc/ntp.conf" do
  notifies :restart, 'service[ntpd]'
end

service "ntpd" do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end