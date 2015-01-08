#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-user
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

group node['chef-dash']['dev']['group'] do
end

user node['chef-dash']['dev']['user'] do
  comment 'Development User'
  shell '/bin/bash'
  group node['chef-dash']['dev']['group']
  home node['chef-dash']['dev']['userHome']
end

directory node['chef-dash']['dev']['userHome'] do
  owner node['chef-dash']['dev']['user']
  group node['chef-dash']['dev']['group']
  mode '0755'
  recursive true
end

Dir[ "/etc/skel/.*" ].each do |path|
  file "#{node['chef-dash']['dev']['userHome']}/#{Pathname.new(path).basename}" do
    owner node['chef-dash']['dev']['user']
    group node['chef-dash']['dev']['group']
    mode '0644'
    content lazy { IO.read(path) }
    action :create_if_missing
  end if File.file?(path)
end
