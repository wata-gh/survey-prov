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

%w/git epel-release httpd-devel curl-devel
   apr-devel apr-util-devel libffi-devel openssh openssl
   openssl-devel readline-devel libxml2-devel libxslt-devel
   mysql mysql-server mysql-devel nodejs npm ImageMagick ImageMagick-devel
   docker-io
   /.each do |pkg|
  package pkg
end

package 'python-setuptools'

execute 'install aws-cli' do
  user 'root'
  command <<-EOS
    easy_install pip
    pip install awscli
EOS
end

execute 'install docker-component' do
  user 'root'
  command <<-EOS
    curl -L https://github.com/docker/compose/releases/download/1.4.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
EOS
end


directory '/app/survey' do
  owner 'webservice'
  group 'webservice'
  mode  '755'
  action :create
end
