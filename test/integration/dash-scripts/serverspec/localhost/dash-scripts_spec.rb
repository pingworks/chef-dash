require_relative '../spec_helper'

describe file('/opt/dash/scripts') do
  it { should be_directory }
end

describe file('/tmp/dash/.git') do
  it { should be_directory }
end

describe file('/opt/dash/scripts/repo') do
  it { should be_directory }
end


describe file('/opt/dash/scripts/configs') do
  it { should be_symlink }
  it { should be_linked_to '/etc/dash-scripts' }
end

