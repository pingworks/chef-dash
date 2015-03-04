#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev
#
# Copyright 2014 pingworks - Alexander Birk und Christoph Lukas
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt'

%w(vim less git wget zip unzip default-jre ant ant-contrib ruby rubygems ruby-compass xvfb iceweasel phpunit phpunit-selenium x11vnc).each do |p|
  package p do
    action :install
  end
end

cookbook_file 'network_interfaces' do
  path '/etc/network/interfaces'
  owner 'root'
  group 'root'
  mode '644'
end

execute 'ifup_eth1' do
  command '/sbin/ifup eth1'
end

include_recipe 'chef-dash::dash-dev-user'

include_recipe 'chef-dash::dash-dev-src'
include_recipe 'chef-dash::dash-dev-src-outside'

include_recipe 'chef-dash::dash-dev-apache'

include_recipe 'chef-dash::dash-dev-testdata'

include_recipe 'chef-dash::dash-dev-buildtools'

include_recipe 'chef-dash::dash-dev-initial-frontend-build'

# add dash-test entry to /etc/hosts
bash 'add_dash-test_to_hosts_file' do
  code "echo '127.0.0.1 dash-test selenium' >> /etc/hosts"
  not_if "grep '127.0.0.1 dash-test' /etc/hosts"
end
