remote_directory '/etc/nginx' do
  action :create
  source 'files/etc/nginx'
  owner 'webservice'
  group 'webservice'
end

service 'nginx' do
  action :start
end
