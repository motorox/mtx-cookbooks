Chef::Log.info "Executing #{cookbook_name}::#{recipe_name}"

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
