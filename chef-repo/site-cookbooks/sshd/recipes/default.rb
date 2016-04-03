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

# su �R�}���h�ŁAwheel �O���[�v�̂� root �ɂȂ��悤�ɐݒ�
template "login.defs" do
  owner  "root"
  group  "root"
  path   "/etc/login.defs"
  mode   "0440"
end

# wheel �O���[�v�̃����o�[�̂� root �ɂȂ��悤�ɐݒ�
# template "su" do
#   owner  "root"
#   group  "root"
#   path   "/etc/pam.d/su"
#   mode   "0440"
# end

# root �ł� ssh ���O�C�����֎~����悤�ɐݒ�
# ��p�X���[�h�֎~
# template "sshd_config" do
#   owner  "root"
#   group  "root"
#   path   "/etc/ssh/sshd_config"
#   mode   "0644"
# end
