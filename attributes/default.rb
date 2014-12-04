# Dash Scripts Sources
default['chef-dash']['scripts']['gitrepo']['url'] = 'https://github.com/pingworks/dash.git'

default['chef-dash']['scripts']['install_path'] = '/opt/dash/scripts'
default['chef-dash']['scripts']['config_path'] = '/etc/dash-scripts'

default['chef-dash']['scripts']['config_always_update'] = true

# Repo Config
default['chef-dash']['repo']['dir'] = '/data/repo'
default['chef-dash']['repo']['owner'] = 'repo'
default['chef-dash']['repo']['group'] = 'repo'
