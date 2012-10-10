# Cookbook Name:: varnish
# Recipe:: default
# Author:: Joe Williams <joe@joetify.com>
# Contributor:: Patrick Connolly <patrick@myplanetdigital.com>
#
# Copyright 2008-2009, Joe Williams
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

package "varnish"

template "#{node['varnish']['dir']}/default.vcl" do
  source "default.vcl.erb"
  owner "root"
  group "root"
  mode 0644
end

template node['varnish']['default'] do
  source "custom-default.erb"
  owner "root"
  group "root"
  mode 0644
  notifies :restart, "service[varnish]"
end

# This next section ensures that the directory for varnish storage is created
# Merged commit from https://github.com/willthames/cookbooks/blob/c0c1bd60e11702cc2050e4f4797a69baeb9c10b1/varnish/attributes/default.rb
directory "/var/lib/varnish/#{node[:fqdn]}" do
  owner "root"
  group "root"
end

service "varnish" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end

service "varnishlog" do
  supports :restart => true, :reload => true
  action [ :enable, :start ]
end
