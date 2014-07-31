#
# Cookbook Name:: sigserver
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

src_filename = "SIGServer-#{node['sigserver']['version']}.tar.gz"
src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{Chef::Config['file_cache_path']}/SIGServer-#{node['sigserver']['version']}"

src_url = "http://downloads.sourceforge.net/project/sigverse/SIGServer/#{src_filename}?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsigverse%2Ffiles%2FSIGServer%2F&ts=1406793135&use_mirror=jaist"

libjvm_path = node['sigserver']['libjvm_path']
julius_path = node['sigserver']['julius_path']
dictkit_path = node['sigserver']['dictkit_path']

bash "copy_jdk_headers" do
  user "root"
  cwd node['sigserver']['jdk_include_path']
  code <<-EOH
    cp *.h /usr/local/include
    cp linux/*.h /usr/local/include
  EOH
end

remote_file src_filepath do
  source src_url
  checksum node['sigserver']['tgz_checksum']
  mode '0644'
  notifies :run, "bash[compile_sigserver]", :immediately
end

bash "compile_sigserver" do
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    rm -rf #{extract_path}
    tar xzf #{src_filename}
    cd #{extract_path}
    make -f Makefile.dev release
    make -f Makefile.dev autoconf
    ./configure --prefix=#{node['sigserver']['install_prefix']} --with-jvm=#{libjvm_path} --with-julius=#{julius_path} --with-dictkit=#{dictkit_path}
    make
  EOH
  notifies :run, "bash[install_sigserver]", :immediately
  action :nothing
end

bash "install_sigserver" do
  user "root"
  cwd Chef::Config['file_cache_path']
  code <<-EOH
    cd #{extract_path}
    make install
  EOH
  action :nothing
end
