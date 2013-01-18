include_recipe "apt"

apt_repository "brightbox" do
  uri "http://ppa.launchpad.net/brightbox/passenger"
  distribution node['lsb']['codename']
  keyserver "keyserver.ubuntu.com"
  key "C3173AA6"
end