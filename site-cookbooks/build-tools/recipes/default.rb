#
# Cookbook Name:: build-tools
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(autoconf automake libtool pkg-config git).each do |pkg|
  package pkg do
    action :upgrade
  end
end
