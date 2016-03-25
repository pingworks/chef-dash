#
# Cookbook Name:: chef-dash
# Recipe:: dash-dev-buildtools
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

# Jdeb for ant
remote_file '/usr/share/ant/lib/jdeb-1.0.1.jar' do
  source 'http://repo1.maven.org/maven2/org/vafer/jdeb/1.0.1/jdeb-1.0.1.jar'
  action :create_if_missing
end

# Sencha Cmd
remote_file "/var/tmp/SenchaCmd-#{node['chef-dash']['dev']['senchacmdVersion']}-linux-x64.run.zip" do
  # source "http://cdn.sencha.com/cmd/#{node['chef-dash']['dev']['senchacmdVersion']}/SenchaCmd-#{node['chef-dash']['dev']['senchacmdVersion']}-linux-x64.run.zip"
  source "#{node['chef-dash']['dev']['pgkRepoUrl']}/SenchaCmd-#{node['chef-dash']['dev']['senchacmdVersion']}-linux-x64.run.zip"
  action :create_if_missing
  not_if { ::File.directory?("/opt/Sencha/Cmd/#{node['chef-dash']['dev']['senchacmdVersion']}") }
end

bash 'install_sencha_cmd' do
  cwd '/var/tmp'
  code <<-EOH
  unzip SenchaCmd-#{node['chef-dash']['dev']['senchacmdVersion']}-linux-x64.run.zip
  chmod 755 SenchaCmd-#{node['chef-dash']['dev']['senchacmdVersion']}-linux-x64.run
  ./SenchaCmd-#{node['chef-dash']['dev']['senchacmdVersion']}-linux-x64.run --mode unattended --prefix /opt
  chown -R #{node['chef-dash']['dev']['user']}:#{node['chef-dash']['dev']['group']} /opt/Sencha
  EOH
  not_if { ::File.directory?("/opt/Sencha/Cmd/#{node['chef-dash']['dev']['senchacmdVersion']}") }
end

# PhantomJS
remote_file "/var/tmp/phantomjs-#{node['chef-dash']['dev']['phantomjsVersion']}-linux-x86_64.tar.bz2" do
  source "https://phantomjs.googlecode.com/files/phantomjs-#{node['chef-dash']['dev']['phantomjsVersion']}-linux-x86_64.tar.bz2"
  action :create_if_missing
  not_if { ::File.directory?("/opt/phantomjs-#{node['chef-dash']['dev']['phantomjsVersion']}-linux-x86_64") }
end

bash 'install_phantomjs' do
  cwd '/opt'
  code <<-EOH
  tar xfj /var/tmp/phantomjs-#{node['chef-dash']['dev']['phantomjsVersion']}-linux-x86_64.tar.bz2
  EOH
  not_if { ::File.directory?("/opt/phantomjs-#{node['chef-dash']['dev']['phantomjsVersion']}-linux-x86_64") }
end

# Headless Selenium
directory '/usr/lib/headless-selenium/profiles/firefox' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

directory '/etc/headless-selenium' do
  owner 'root'
  group 'root'
  mode '0755'
  recursive true
end

srcdir = "#{node['chef-dash']['dev']['srcBaseDir']}/#{node['chef-dash']['dev']['srcdir']}"
bash 'install_headless-selenium' do
  cwd '/opt'
  code <<-EOH
  git clone https://github.com/generalredneck/headless-selenium
  ln -s #{srcdir}/tests/system/selenium/user-extensions.js /usr/lib/headless-selenium/
  tar xvfz /opt/headless-selenium/selenium-profile.tar.gz -C /usr/lib/headless-selenium/profiles/firefox
  EOH
  not_if { ::File.directory?('/opt/headless-selenium') }
end

remote_file "/usr/lib/headless-selenium/selenium-server-standalone-#{node['chef-dash']['dev']['seleniumVersion']}.jar" do
  source node['chef-dash']['dev']['seleniumUrl']
  action :create_if_missing
  not_if { ::File.directory?("/usr/lib/headless-selenium/selenium-server-standalone-#{node['chef-dash']['dev']['seleniumVersion']}.jar") }
end

cookbook_file 'init_d_headless_selenium' do
  path '/etc/init.d/headless-selenium'
  owner 'root'
  group 'root'
  mode '755'
end

cookbook_file 'selenium_conf' do
  path '/etc/headless-selenium/selenium.conf'
  owner 'root'
  group 'root'
  mode '644'
end

execute 'start_headless-selenium' do
  command '/etc/init.d/headless-selenium status || /etc/init.d/headless-selenium start'
end
