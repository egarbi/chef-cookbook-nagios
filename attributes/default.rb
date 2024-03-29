#
# Author:: Seth Chisamore <schisamo@opscode.com>
# Cookbook Name:: nagios
# Attributes:: default
#
# Copyright 2011, Opscode, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['nagios']['user'] = "nagios"
default['nagios']['group'] = "nagios"

set['nagios']['plugin_dir'] = "/usr/lib/nagios/plugins"
set['nagios']['noc_dir'] = "/srv/noc"
set['nagios']['non_std_plugin_dir'] = "#{node['nagios']['noc_dir']}/plugins"
set['nagios']['passive_dir'] = "#{node['nagios']['noc_dir']}/passive"
# This is temporal
set['nsca']['fqdn'] = "nagios00.ams5.empresa.com"
