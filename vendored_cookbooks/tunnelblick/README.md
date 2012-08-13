Description
===========

Installs Tunnelblick

Requirements
============

## Platform

* Mac OS X.

## Cookbooks

* dmg

Requires an OpenVPN server somewhere. You can set one up with http://ckbk.it/openvpn.

Attributes
==========

* `node['tunnelblick']['checksum']` - sha1 checksum of the DMG file.
* `node['tunnelblick']['version']` - version of tunnelblick to download.
* `node['tunnelblick']['url']` - URL of the tunnelblick DMG to download.

Usage
=====

Put the tunnelblick recipe in the run list and have you some OpenVPN.

License and Author
==================

Copyright 2010, Joshua Timberman (<opensource@housepub.org>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
