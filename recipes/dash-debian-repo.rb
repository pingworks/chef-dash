package 'apt-transport-https'

# if node attributes use-corp-repo is true set the repo url and dist 
# to the corporate repo, and include the add-apt-key recipe
# if not, use the pingworks deb repo and ubuntu keyserver

if node['chef-dash']['use-corp-repo'].include? "true"
  include_recipe 'chef-dash::add-apt-key'
else
  apt_repository 'pingworks-dashboard' do
    uri node['chef-dash']['debrepo']['url']
    distribution node['chef-dash']['debrepo']['dist']
    components node['chef-dash']['debrepo']['comp']
    keyserver node['chef-dash']['debrepo']['keyserver']
    key node['chef-dash']['debrepo']['key']
    action :add
  end
end
