description 'Cookbook for installing required packages on a preferred Ubuntu machine'
license 'MIT'

long_description <<-EOH
= DESCRIPTION:

Complete Debian/Ubuntu machine.

= REQUIREMENTS:

Debian or Ubuntu preferred.

Red Hat/CentOS and Fedora can be used but will be converted to
a Debian/Ubuntu style Apache as it's far easier to manage
with Chef.

= ATTRIBUTES:

The file attributes/apache.rb contains the following attribute
types:

* platform specific locations and settings.
* general settings

EOH

version '0.0.1'
depends "nodejs-proxy"
