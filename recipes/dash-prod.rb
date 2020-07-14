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

# include_recipe 'apache2::default'
# include_recipe 'php::default'

apt_package 'libapache2-mod-php'
apt_package 'php'
apt_package 'php-curl'
apt_package 'zend-framework'

cookbook_file = 'a2site_dash-prod'
apacheconf_file = 'dash-prod'
unless node['platform'] == 'debian' && node['platform_version'].match('^7')
  cookbook_file += '-24'
  apacheconf_file += '.conf'
end
cookbook_file cookbook_file do
  path '/etc/apache2/sites-available/' + apacheconf_file
end

bash 'enable_apache_site' do
  code 'a2ensite dash-prod'
end

bash 'enable_apache_dissite' do
  code 'a2dissite 000-default'
  only_if 'ls -1 /etc/apache2/sites-available/ | grep 000-default'
end

bash 'enable_apache_enmod' do
  code 'a2enmod rewrite'
end

bash 'apache2_restart' do
  code 'service apache2 restart'
end

include_recipe 'chef-dash::dash-debian-repo'

include_recipe 'chef-dash::dash-backend'
include_recipe 'chef-dash::dash-frontend'
