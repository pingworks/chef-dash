#
# Cookbook Name:: chef-dash
# Recipe:: dash-scripts
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

git '/tmp/dash' do
  repository node['chef-dash']['scripts']['gitrepo']['url']
  reference 'master'
  action :sync
end

directory node['chef-dash']['scripts']['install_path'] do
  recursive true
  action :create
end

package 'rsync'

bash 'rsync scripts checkout' do
  code <<-EOL
    rsync -avx --exclude=configs /tmp/dash/scripts/ #{node['chef-dash']['scripts']['install_path']}/
  EOL

end

bash 'rsync config' do
  code <<-EOL
    mkdir #{node['chef-dash']['scripts']['config_path']}
    rsync -avx /tmp/dash/scripts/configs/ #{node['chef-dash']['scripts']['config_path']}/
    ln -s #{node['chef-dash']['scripts']['config_path']} #{node['chef-dash']['scripts']['install_path']}/configs
  EOL
  not_if "test -d #{node['chef-dash']['scripts']['config_path']}"
end




