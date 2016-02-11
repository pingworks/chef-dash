#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-apache
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
['libapache2-mod-php5','php5', 'php5-curl', 'zendframework', 'apache2-mpm-prefork'].each do |pkg|
  apt_package pkg do
    action :upgrade
  end
end

cookbook_file 'a2site_dash-dev' do
  path '/etc/apache2/sites-available/dash-dev'
end

bash 'enable_apache_site' do
  code 'a2ensite dash-dev'
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
