#
# Cookbook Name:: use-bash
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

bash "use-bash" do
  code <<-EOH
    echo 'dash dash/sh boolean false' | debconf-set-selections
    dpkg-reconfigure -p critical dash
  EOH
end
