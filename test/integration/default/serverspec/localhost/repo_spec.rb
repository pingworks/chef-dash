require_relative '../spec_helper'

describe user('repo') do
  it { should exist }
  it { should belong_to_group 'repo' }
end

describe user('repo') do
  it { should have_home_directory '/home/repo' }
end

describe user('repo') do
  it { should have_login_shell '/bin/bash' }
end

describe file('/data/repo') do
  it { should be_directory }
  it { should be_readable.by('others') }
  it { should be_writable.by_user('repo') }
end

# Smoketest Repo
describe command "curl 'http://localhost/repo/'" do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match 'Index of \/repo' }
end
