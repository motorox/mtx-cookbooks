
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

include_recipe 'nodejs-proxy'