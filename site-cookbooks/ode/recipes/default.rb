#
# Cookbook Name:: ode
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

src_filename = "ode-#{node['ode']['version']}.tar.gz"

src_filepath = "#{Chef::Config['file_cache_path']}/#{src_filename}"
extract_path = "#{Chef::Config['file_cache_path']}/ode-#{node['ode']['version']}"
src_url = "http://downloads.sourceforge.net/project/opende/ODE/#{node['ode']['version']}/#{src_filename}?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fopende%2Ffiles%2FODE%2F0.12%2F&ts=1406791238&use_mirror=#{node['ode']['sourceforge_mirror']}"
configure_options = "--disable-tests --without-x --enable-double-precision --with-trimesh=opcode --enable-release --enable-shared"

remote_file src_filepath do
  source src_url
  checksum node['ode']['tgz_checksum']
  mode '644'
  notifies :run, "bash[compile_ode]", :immediately
end

bash "compile_ode" do
  cwd "#{Chef::Config['file_cache_path']}"
  code <<-EOH
    rm -rf #{extract_path}
    tar -xzf #{src_filename}
    cd #{extract_path}
    ./configure #{configure_options}
    make
  EOH
  notifies :run, "bash[install_ode]", :immediately
end

bash "install_ode" do
  user "root"
  cwd "#{Chef::Config['file_cache_path']}"
  code <<-EOH
    cd #{extract_path}
    make install
    ldconfig
  EOH
end
