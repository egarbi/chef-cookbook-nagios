#
# Author:: Enrique Garbi <garbi@nimbuzz.com>
# Cookbook Name:: nagios
# Recipe:: server_pnp
#
# Copyright 2009, 37signals
# Copyright 2009-2011, Opscode, Inc
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

# Install pnp4nagios on debian
package "pnp4nagios" do
  action :install
end

template "/etc/default/npcd" do
  source "npcd.erb"
  owner "root"
  group "root"
  mode "0644"
end


# NPCD
service "npcd" do
  action [ :enable, :start ]
  supports :restart => true, :reload => true
  ignore_failure true
end

group "nagios" do
  members ['git-deploy']
end

directory "#{node['nagios']['pnp-templates-repo']}" do
  owner "root"
  group "nagios"
  mode "0775"
  recursive true
end

if "test -d node['nagios']['pnp-templates-repo']" 
 git "#{node['nagios']['pnp-templates-repo']}" do
   repository "git@git00.ams5.buzzaa.com:pnp_nimbuzz_templates.git"
   user "git-deploy"
   group "nagios"
   action :sync 
 end
# ln -s /srv/git-deploy/pnp-nimbuzz-templates/templates /etc/pnp4nagios/templates
 link "#{node['nagios']['pnp-conf_dir']}/templates" do
   to "#{node['nagios']['pnp-templates-repo']}/templates"
 end
end

# Custom templates for passives and nrpe checks
%w[ nrpe_1arg dummy ].each do |cfg | 
  template "#{node['nagios']['pnp-conf_dir']}/check_commands/check_#{cfg}.cfg" do
    source "check_#{cfg}.cfg.erb"
    mode "0644"
  end
end

