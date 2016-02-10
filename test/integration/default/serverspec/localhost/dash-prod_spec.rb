require_relative '../spec_helper'

describe service 'apache2' do
  it { should be_running }
end

describe package 'apache2-mpm-prefork' do
  it { should be_installed }
end

describe package('php5') do
  it { should be_installed }
end

describe package('libapache2-mod-php5') do
  it { should be_installed }
end

describe file '/etc/apache2/sites-available/dash-prod' do
  its (:content) { should match /DocumentRoot \/opt\/dash\/public/ }
  its (:content) { should match /SetEnv APPLICATION_ENV "production"/ }
end

describe file('/etc/apt/sources.list.d/pingworks-dashboard.list') do
  it { should be_file }
end

describe file('/etc/apt/sources.list.d/pingworks-dashboard.list') do
  its(:content) { should match '^deb\s*https://dash.pingworks.net/debian' }
end

describe package('dash-backend') do
  it { should be_installed }
end

describe package('dash-frontend') do
  it { should be_installed }
end

# Smoketest Backend
describe command "curl 'http://localhost/branch' -H 'X-Requested-With: XMLHttpRequest'" do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /"success":true/ }
end

# Smoketest Frontend
describe command "curl 'http://localhost/config.js'" do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match /Dash\.config = / }
end
