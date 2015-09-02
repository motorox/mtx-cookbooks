# mtx-cookbooks

This is the cookbook used on Monsoon to create instances of virtual machines.

## DESCRIPTION:

Complete Debian/Ubuntu machine.
Installs different coonfigurations on one (or more) servers

## REQUIREMENTS:

Debian or Ubuntu preferred.

Red Hat/CentOS and Fedora can be used but will be converted to
a Debian/Ubuntu style Apache as it's far easier to manage
with Chef.

## ATTRIBUTES:

The file attributes/apache.rb contains the following attribute
types:

* platform specific locations and settings.
* general settings
