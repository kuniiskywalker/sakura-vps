#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# wheel �O���[�v�̃��[�U�[�̂� sudo �R�}���h�����s�ł���悤�ɐݒ�
template "sudoers" do
  owner  "root"
  group  "root"
  path   "/etc/sudoers"
  mode   "0440"
end
