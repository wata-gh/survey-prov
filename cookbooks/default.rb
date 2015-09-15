include_recipe 'selinux::disabled'

service 'iptables' do
  action [:disable, :stop]
end
service 'ip6tables' do
  action [:disable, :stop]
end

execute 'change localtime to JST' do
  user 'root'
  command <<-EOC
  cp -p /usr/share/zoneinfo/Japan /etc/localtime
  echo 'ZONE="Asia/Tokyo"' > /etc/sysconfig/clock
  echo 'UTC=false' >> /etc/sysconfig/clock
  EOC
end

package 'python-setuptools'

execute 'install aws-cli' do
  user 'root'
  command <<-EOS
    easy_install pip
    pip install awscli
EOS
end

execute 'install ruby' do
  user 'webservice'
  cwd '/home/webservice'
  command <<-EOS
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  rbenv install 2.2.3
  rbenv global 2.2.3
EOS
  not_if 'test -d ~/.rbenv'
end

directory '/app/survey' do
  owner 'webservice'
  group 'webservice'
  mode  '755'
  action :create
end
