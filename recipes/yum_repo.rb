# Cookbook Name:: varnish
# Recipe:: yum_repo
# Author:: Cristian Ivascu <ivascucristian@gmail.com
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

if node[:kernel][:machine] == "i686"
	rpm_arch = "i386"
else
	rpm_arch = node[:kernel][:machine] 
end

yum_repository "varnish-cache" do
  description "Varnish 3.0 for RedHat Enterprise Linux and Variants"
  url "http://repo.varnish-cache.org/redhat/varnish-3.0/el5/#{rpm_arch}"
  action :add
end
