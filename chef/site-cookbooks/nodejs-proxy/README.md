SAP Proxy Cookbook for Monsoon 2.0
==================================

The proxy cookbook is supposed to set all proxy specifc settings in Monsoon 2.0.

**IMPORTANT: It is not intended for use in barkeeper projects.**

Currently it only takes care of setting the proxies for the current and subsequent chef runs.
It basically does three things:

1. Set *\*_proxy* and *no_proxy* variables in the `ENV` hash during *chef compile-time*
2. Sets `Chef::Config[*_proxy]` settings during *chef compile-time*
3. Drops the file `/etc/profile.d/proxy_settings.sh` which exports the *\*_proxy* environment variables in future login shells

Configuration
=============
The proxy settings are configured via the following node attributes:

* `node.proxy.http`: specify an http proxy (default: `'http://proxy.wdf.sap.corp:8080'`)
* `node.proxy.https`: specify an https proxy (default: `node.proxy.http` )
* `node.proxy.ftp`: specify an ftp proxy (default: `node.proxy.http` )
* `node.proxy.all`: specify an all proxy (default: `node.proxy.http` )
* `node.proxy.excludes`: specify a list of excluded host (default: `'sap.corp,10.*,localhost,127.0.0.1,0.0.0.0,moo-repo,169.254.169.254'` )
