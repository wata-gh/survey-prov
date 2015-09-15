%w/.bashrc .git-completion.bash .git-prompt.sh/.each do |f|
  remote_file "/home/webservice/#{f}" do
    owner 'webservice'
    group 'webservice'
  end
end

directory '/home/webservice/projects' do
  action :create
  owner 'webservice'
  group 'webservice'
end
