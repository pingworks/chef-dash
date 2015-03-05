package 'apt-transport-https'

apt_repository 'pingworks-dashboard' do
  uri node['chef-dash']['debrepo']['url']
  distribution node['chef-dash']['debrepo']['dist']
  components node['chef-dash']['debrepo']['comp']
  keyserver node['chef-dash']['debrepo']['keyserver']
  key node['chef-dash']['debrepo']['key']
  action :add
end
