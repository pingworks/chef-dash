#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-testdata
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

remote_file "/var/tmp/full-bundle_LATEST.tar.gz" do
  source "https://dash.pingworks.net/repo/master/full-bundle_LATEST.tar.gz"
  action :create_if_missing
end

bash 'install_dash_tests_data' do
  cwd '/var/tmp'
  code <<-EOH
  dpkg -l dash-tests-data > /dev/null && exit 0
  rm -rf bundle
  mkdir bundle
  tar xfz full-bundle_LATEST.tar.gz -C bundle
  dpkg --force-confnew -i bundle/artifacts/dash-tests-data_*.deb
  EOH
end
