#
# Cookbook Name:: sshd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory "/root/bin" do
  owner 'root'
  group 'root'
  action :create
end

cookbook_file "/root/bin/chroot-useradd" do
  mode  "0755"
  owner "root"
  group "root"
end

service "sshd" do
  action :restart
end

# user "admin" do
#   password ""
#   action   [:create]
# end

# group "wheel" do
#   action  :modify
#   members ["admin"]
#   append  true
# end

# su コマンドで、wheel グループのみ root になれるように設定
template "login.defs" do
  owner  "root"
  group  "root"
  path   "/etc/login.defs"
  mode   "0440"
end

# wheel グループのメンバーのみ root になれるように設定
# template "su" do
#   owner  "root"
#   group  "root"
#   path   "/etc/pam.d/su"
#   mode   "0440"
# end

# root での ssh ログインを禁止するように設定
# 空パスワード禁止
# template "sshd_config" do
#   owner  "root"
#   group  "root"
#   path   "/etc/ssh/sshd_config"
#   mode   "0644"
# end
