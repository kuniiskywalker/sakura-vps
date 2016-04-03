#
# Cookbook Name:: selinux
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# setenforce 0�ňꎞ�I��SELinux�𖳌������A
# /etc/selinux/config�̍쐬��ʒm����
# selinuxenabled�R�}���h�̏I���X�e�[�^�X��0(selinux���L��)�̏ꍇ�������s�����
execute "disable selinux enforcement" do
  only_if "which selinuxenabled && selinuxenabled"
  command "setenforce 0"
  action :run
  notifies :create, "template[/etc/selinux/config]"
end

# �ċN���̍ۂ�SELinux�̖�����Ԃ��ێ����邽�߂ɁA
# /etc/selinux/config�ɁA�ݒ���L�q����
template "/etc/selinux/config" do
  source "config.erb"
  variables(
    :selinux => "disabled",
    :selinuxtype => "targeted"
  )
  action :nothing
end
