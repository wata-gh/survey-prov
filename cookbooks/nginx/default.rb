remote_directory '/etc/nginx' do
  action :create
  source '/etc/nginx'
  owner 'webservice'
  group 'webservice'
end
