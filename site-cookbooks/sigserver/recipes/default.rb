#
# Cookbook Name:: sigserver
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

src_filename = "SIGServer-#{node['sigserver']['version']}.tar.gz"
src_url = "http://downloads.sourceforge.net/project/sigverse/SIGServer/#{src_filename}?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsigverse%2Ffiles%2FSIGServer%2F&ts=1406793135&use_mirror=jaist"
extract_path = "SIGServer-#{node['sigserver']['version']}"
libjvm_path = "/usr/lib/jvm/java-6-openjdk-i386/jre/lib/i386/server"
julius_path = "/usr/bin/julius"
dictkit_path = "/usr/local/share/dictation-kit-v#{node['julius']['dictkit_version']}"

bash "copy_jdk_headers" do
  user "root"
  cwd "/usr/lib/jvm/java-6-openjdk-i386/include"
  code <<-EOH
    cp *.h /usr/local/include
    cp linux/*.h /usr/local/include
  EOH
  notifies :run, "bash[install_sigserver]", :immediately
end

bash "install_sigserver" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    rm -rf #{src_filename} #{extract_path}
    wget -O #{src_filename} '#{src_url}'
    tar xzf #{src_filename}
    cd #{extract_path}
    make -f Makefile.dev release
    make -f Makefile.dev autoconf
    ./configure --prefix=/usr/local --with-jvm=#{libjvm_path} --with-julius=#{julius_path} --with-dictkit=#{dictkit_path}
    make
    make install
  EOH
  action :nothing
end
