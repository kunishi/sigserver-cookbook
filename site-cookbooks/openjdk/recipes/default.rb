#
# Cookbook Name:: openjdk
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(openjdk-6-jdk).each do |pkg|
  package pkg do
    action :upgrade
    notifies :run, "execute[copy_jdk_headers]", :immediately
  end
end

execute "copy_jdk_headers" do
  command "cp /usr/lib/jvm/java-6-openjdk-i386/include/*.h /usr/local/include"
  command "cp /usr/lib/jvm/java-6-openjdk-i386/include/linux/*.h /usr/local/include"
  action :nothing
end
