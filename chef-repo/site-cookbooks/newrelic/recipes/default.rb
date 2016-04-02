#
# Cookbook Name:: newrelic
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
license_key ="#{node['newrelic']['license_key']}"

remote_file "/tmp/webtatic_repo_latest.rpm" do
    source "http://download.newrelic.com/pub/newrelic/el5/i386/newrelic-repo-5-3.noarch.rpm"
    action :create
end

rpm_package "newrelic-repo" do
    source "/tmp/webtatic_repo_latest.rpm"
    action :install
end

package "newrelic-sysmond" do
  action :install
end

execute "auth newrelic license" do
  command <<-EOH
     nrsysmond-config --set license_key=#{license_key}
  EOH
end

service "newrelic-sysmond" do
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end
