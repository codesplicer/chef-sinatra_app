include_recipe "sinatra_app::webserver"

# Use the magical deploy_resource module in chef
deploy_revision node[:sinatra_app][:deploy_dir] do
  scm_provider Chef::Provider::Git
  repo node[:sinatra_app][:repository]
  revision node[:sinatra_app][:branch]
  symlink_before_migrate.clear
  create_dirs_before_symlink.clear
  purge_before_symlink.clear
  symlinks.clear
  user node[:apache][:user]
  group node[:apache][:group]
    
  action :deploy
  notifies :restart, "service[apache2]"
end
