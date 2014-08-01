#
# Cookbook Name:: opengl
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

%w(freeglut3 freeglut3-dbg freeglut3-dev).each do |pkg|
  package pkg do
    action :upgrade
  end
end
