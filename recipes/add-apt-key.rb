#
# Cookbook Name:: chef-dash
# Recipe:: prod
#
# Copyright (C) 2016 Mini Shridhar (mini.shridhar@hybris.com)
#
# All rights reserved - Do Not Redistribute
#

cookbook_file '/tmp/dash.key' do
  source 'dash.key'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'add_dash_key' do
  command '/usr/bin/apt-key add /tmp/dash.key'
  action :nothing
end
