include_recipe 'nownabe_nginx'
include_recipe '../cookbooks/users/default.rb'
include_recipe '../cookbooks/webservice/default.rb'
include_recipe 'rtn_rbenv::user'
include_recipe '../cookbooks/default.rb'
include_recipe '../cookbooks/sudoers/default.rb'
include_recipe '../cookbooks/nginx/default.rb'
