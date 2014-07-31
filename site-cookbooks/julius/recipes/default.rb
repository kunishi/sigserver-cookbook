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
dictkit_src_url = "http://#{node['julius']['dictkit_sourceforge_mirror']}.dl.sourceforge.jp/julius/59050/#{dictkit_src_filename}"

extract_prefix = "/usr/local/share"
extract_path = "#{extract_prefix}/dictation-kit-v#{node['julius']['dictkit_version']}"

remote_file dictkit_src_filepath do
  source dictkit_src_url
  checksum node['julius']['dictkit_sourceforge_mirror']
  mode "644"
  notifies :run, "execute[extract_dictkit]", :immediately
end

execute 'extract_dictkit' do
  command "rm -rf #{extract_path}"
  command "tar xzf #{dictkit_src_filepath} -C #{extract_prefix}"
  action :nothing
end
