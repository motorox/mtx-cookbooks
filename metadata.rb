name             'mtx-cookbooks'
maintainer       'Mircea Romanitan (SAP)'
maintainer_email 'mircea.romanitan@sap.com'
license          'MIT'
description      'Installs different coonfigurations on one (or more) servers'

long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version          '0.0.14'

depends "LJS"
depends 'postgresql'
depends 'java'
depends 'lvm'
depends 'monsoon-search'
depends 'phantomjs'
depends 'ark', "0.4.0"
depends 'nodejs'
depends 'nginx'
depends 'sap-redisio'
depends 'sap-postgresql'
depends 'sap-proxy'
