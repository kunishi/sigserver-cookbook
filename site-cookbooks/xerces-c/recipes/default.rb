#
# Cookbook Name:: xerces-c
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(libxerces-c3.1 libxerces-c-dev).each do |pkg|
  package pkg do
    action :upgrade
  end
end
