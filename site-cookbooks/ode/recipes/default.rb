#
# Cookbook Name:: ode
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

src_filename = "ode-#{node['ode']['version']}.tar.gz"
src_url = "http://downloads.sourceforge.net/project/opende/ODE/#{node['ode']['version']}/#{src_filename}?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fopende%2Ffiles%2FODE%2F0.12%2F&ts=1406791238&use_mirror=jaist"
extract_path = "ode-#{node['ode']['version']}"
configure_options = "--disable-tests --without-x --enable-double-precision --with-trimesh=opcode --enable-release --enable-shared"

bash "install_ode" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    rm -rf #{src_filename} #{extract_path}
    wget -O #{src_filename} '#{src_url}'
    tar -xzf #{src_filename}
    cd #{extract_path}
    ./configure #{configure_options}
    make
    make install
    ldconfig
    rm -rf #{src_filename} #{extract_path}
  EOH
end
