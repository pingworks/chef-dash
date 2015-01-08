#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-initial-frontend-build
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

bash 'prepare_sencha_cmd_for_user' do
  code "echo 'export PATH=/opt/Sencha/Cmd/#{node['chef-dash']['dev']['senchacmdVersion']}:$PATH' >> #{node['chef-dash']['dev']['userHome']}/.bashrc"
  user node['chef-dash']['dev']['user']
  group node['chef-dash']['dev']['group']
  not_if "grep /opt/Sencha/Cmd/#{node['chef-dash']['dev']['senchacmdVersion']} #{node['chef-dash']['dev']['userHome']}/.bashrc"
end

# Initial Build
srcDir = "#{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcDir']}"
bash 'ant_build' do
  code <<-EOH
  export PATH=/opt/Sencha/Cmd/#{node['chef-dash']['dev']['senchacmdVersion']}:$PATH
  echo "PATH=$PATH"
  cd #{srcDir}/frontend
  ant build
  EOH
  user node['chef-dash']['dev']['user']
  group node['chef-dash']['dev']['group']
  not_if do ::File.directory?("#{srcDir}/frontend/build") end
end
