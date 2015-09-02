name  "nodejs-proxy"
maintainer "Mircea Romanitan"
maintainer_email  "mircea.romanitan@sap.com"
description   "Setups the proxy for accessing resources outside of SAP for Nodejs"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "0.0.1"

%w{
    ubuntu    
    redhat    
    suse
    }.each do |os|
  supports os
end
