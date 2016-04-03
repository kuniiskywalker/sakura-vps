#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# wheel グループのユーザーのみ sudo コマンドを実行できるように設定
template "sudoers" do
  owner  "root"
  group  "root"
  path   "/etc/sudoers"
  mode   "0440"
end
