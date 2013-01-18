#
# Cookbook Name:: sinatra_app
# Recipe:: webserver
#
# Copyright 2013, Vik Bhatti
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'apache2'
include_recipe 'git'
include_recipe 'sinatra_app::brightbox-passenger'

app_name = node[:sinatra_app][:server_name]

# Create vhost
web_app app_name do
  server_name app_name
  docroot node[:sinatra_app][:docroot]
  template "sinatra_app.conf.erb"
  log_dir node[:apache][:log_dir]
end


# Set file and directory perimissions
directory "#{node[:sinatra_app][:deploy_dir]}" do
  owner node[:apache][:user]
  group node[:apache][:user]
  action :create
end


gem_package "sinatra" do
  action :install
end
