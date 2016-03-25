#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-src
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

# Dashboard src
srcdir = "#{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']}"

directory node['chef-dash']['dev']['srcBaseDir'] do
  owner node['chef-dash']['dev']['user']
  group node['chef-dash']['dev']['group']
  mode '0755'
  recursive true
end

bash 'clone_src_repo' do
  code <<-EOH
  rm -rf #{srcdir}
  git clone #{node['chef-dash']['dev']['srcRepoUrl']} #{srcdir}
  chown -R #{node['chef-dash']['dev']['user']}:#{node['chef-dash']['dev']['group']} #{srcdir}
  EOH
  not_if { ::File.exist?("#{srcdir}/.git") }
end
