include_recipe 'sinatra_app::brightbox-ppa'

package 'libapache2-mod-passenger' do
  action :upgrade
  only_if {node[:platform].eql?('ubuntu')}
  notifies :restart, "service[apache2]"
end
