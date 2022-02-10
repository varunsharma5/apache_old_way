#
# Cookbook:: apache_old_way
# Recipe:: server.rb
#
# Copyright:: 2022, The Authors, All Rights Reserved.

package 'httpd' do
  action :install
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  action :create
  notifies :restart, 'service[httpd]', :immediately
end

service 'httpd' do
  action [:enable, :start]
  # subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

# bash 'inline script' do
#   user 'root'
#   code <<-EOH
#   mkdir -p /var/www/mysites/
#   chown -R apache /var/www/mysites/
#   EOH
#   action :run
#   not_if '[ -d /var/www/mysites/ ]'
#   # Using Ruby Code
#   # not_if do
#   #   File.directory?('/var/www/mysites/')
#   # end
# end

# compatible for multiple platform
# execute 'run script' do
#   user 'root'
#   command <<-EOH
#   mkdir -p /var/www/mysites/
#   chown -R apache /var/www/mysites/
#   EOH
#   action :run
#   not_if '[ -d /var/www/mysites/ ]'
# end

# execute 'run script' do
#   user 'root'
#   command './myscript.sh'
#   action :run
#   not_if '[ -d /var/www/mysites/ ]'
# end

# directory '/var/www/mysites/' do
#   owner 'apache'
#   group 'apache'
#   recursive true
#   action :create
# end