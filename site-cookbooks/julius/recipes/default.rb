#
# Cookbook Name:: julius
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(julius libjulius-dev julius-voxforge).each do |pkg|
  package pkg do
    action :upgrade
  end
end

dictkit_src_filename = "dictation-kit-v#{node['julius']['dictkit_version']}.tar.gz"
dictkit_src_filepath = "#{Chef::Config['file_cache_path']}/#{dictkit_src_filename}"
extract_prefix = "/usr/local/share"
extract_path = "#{extract_prefix}/dictation-kit-v#{node['julius']['dictkit_version']}"
dictkit_src_url = "http://jaist.dl.sourceforge.jp/julius/59050/#{dictkit_src_filename}"
dictkit_src_checksum = "a6f6374d14bcce4bbffc3358f9f6ac289fa4dda2958166fce35ad26c5e0fe404"

remote_file dictkit_src_filepath do
  source dictkit_src_url
  checksum dictkit_src_checksum
  owner "root"
  group "root"
  mode "644"
  notifies :run, "execute[extract_dictkit]", :immediately
end

execute 'extract_dictkit' do
  command "tar xzf #{dictkit_src_filepath} -C #{extract_prefix}"
  action :nothing
end
