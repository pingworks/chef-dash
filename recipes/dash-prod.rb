#
# Cookbook Name:: chef-dash
# Recipe:: prod
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

%w(vim less git wget zip unzip).each do |p|
  package p do
    action :install
  end
end

#include_recipe 'apache2::default'
#include_recipe 'php::default'

apt_package 'libapache2-mod-php5'
apt_package 'php5'
apt_package 'php5-curl'

if (node['chef-dash']['platform'] == 'ubuntu-lts') then
  version='1.12.9+dfsg-2+deb8u3'
  remote_file "#{Chef::Config[:file_cache_path]}/zendframework_#{version}_all.deb" do
    source   "http://ftp.de.debian.org/debian/pool/main/z/zendframework/zendframework_#{version}_all.deb"
    action :create_if_missing
  end

  dpkg_package "zendframework_#{version}_all.deb" do
    source "#{Chef::Config[:file_cache_path]}/zendframework_#{version}_all.deb"
    version version
  end
else
  apt_package 'zendframework'
end

apache_conffile='a2site_dash-prod'
if (node['chef-dash']['platform'] == 'ubuntu-lts') then
  apache_conffile += '-24'
end
cookbook_file apache_conffile do
  path '/etc/apache2/sites-available/dash-prod.conf'
end

bash 'enable_apache_site' do
  code 'a2ensite dash-prod'
end

bash 'enable_apache_dissite' do
  code 'a2dissite 000-default'
end

bash 'enable_apache_enmod' do
  code 'a2enmod rewrite'
end

bash 'apache2_restart' do
  code 'service apache2 restart'
end

include_recipe 'chef-dash::dash-debian-repo'

package 'dash-backend' do
  version node['chef-dash']['package']['version']
  action :install
end
package 'dash-frontend' do
  version node['chef-dash']['package']['version']
  action :install
end

template "/etc/dash-backend/application.ini" do
  source 'application_ini.erb'
  owner "root"
  group "root"
  mode '644'
end

template "/etc/dash-frontend/config.js" do
  source 'config_js.erb'
  owner "root"
  group "root"
  mode '644'
end
