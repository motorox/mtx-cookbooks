include_recipe "nginx"

directory "/srv/www/hello" do
  recursive true
end

template "/srv/www/hello/index.html" do
	source "index.html.erb"
end

template "/etc/nginx/sites-available/hello-site" do
  source "hello-site.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[nginx]"
end
nginx_site "hello-site" do
  enable :true
  notifies :restart, "service[nginx]"
end