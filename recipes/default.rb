
Chef::Log.info "Executing #{cookbook_name}::#{recipe_name}"

package "golang" do
  action :upgrade
end

package "nginx" do
  action :upgrade
end

service 'nginx' do
  supports :status => true
  action [:enable, :start]
end

#package "nodejs" do
#	action :upgrade
#end

#package "npm" do
#	action :upgrade
#end

#bash 'npm_proxy' do
#  user 'root'
#  cwd '/home/i305630'
#  code <<-EOH
#  npm config set proxy http://proxy.wdf.sap.corp:8080
#  npm config set http-proxy http://proxy.wdf.sap.corp:8080
#  npm config set https-proxy http://proxy.wdf.sap.corp:8080
#  export npm_config_proxy=http://proxy.wdf.sap.corp:8080
#  export npm_config_https_proxy=http://proxy.wdf.sap.corp:8080
#  cat /var/lib/monsoon/repos/.npmrc > /home/i305630/.npmrc
#  EOH
#end

node.default['nodejs']['engine'] = 'iojs'
node.default['nodejs']['install_method'] = 'package'
include_recipe 'nodejs::iojs'


#
# Make sure the http(s) proxy environment variables are set in the 1st chef run as well.
#
Chef::Log.info 'Setting NPM proxy environment variables'
%w{npm_config npm_config_https}.each do |key|
  ENV["#{key}_proxy"] = node['proxy'][key]
end

ruby_block "force-chef-proxy-settings" do
  block do
    Chef::Config[:npm_config_proxy]  = node['proxy']['npm_config']
    Chef::Config[:npm_config_https_proxy] = node['proxy']['npm_config_https']
    Chef::Log.info "**** Current Chef Proxy config ****************************"
    Chef::Log.info "NPM HTTP Proxy: #{Chef::Config[:npm_config_proxy]}"
    Chef::Log.info "NPM HTTPS Proxy: #{Chef::Config[:npm_config_https_proxy]}"
    Chef::Log.info "***********************************************************"
  end
end 
