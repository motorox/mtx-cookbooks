name             'mtx-cookbooks'
maintainer       'Mircea Romanitan (SAP)'
maintainer_email 'mircea.romanitan@sap.com'
license          'MIT'
description      'Cookbook for installing required packages on a preferred Debian/Ubuntu machine'

long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version          '0.0.14'

%w{ debian ubuntu }.each do |os|
          supports os
end

depends "LJS"
depends 'postgresql'
depends 'java'
depends 'lvm'
depends 'monsoon-search'
depends 'phantomjs'
depends 'ark', "0.4.0"
depends 'nodejs'
depends "nodejs-proxy"
depends 'nginx'
depends 'sap-redisio'
depends 'sap-postgresql'
depends 'sap-proxy'
