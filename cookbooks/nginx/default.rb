remote_directory '/etc/nginx' do
  action :create
  owner 'webservice'
  group 'webservice'
end
