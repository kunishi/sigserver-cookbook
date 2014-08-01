#
# Cookbook Name:: apt-sources-list
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

template "/etc/apt/sources.list" do
  owner "root"
  group "root"
  mode "644"
end
