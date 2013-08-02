#
# Cookbook Name:: nodejs-cookbook
# Recipe:: default
#
# Copyright (C) 2013 Ian Hansen
# 
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
# 
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#

package "nodejs"

name = "node-v#{node[:nodejs][:version]}-linux-#{node[:nodejs][:architecture]}"
is_done = File.executable?("#{node[:nodejs][:install_to]}/node") && `#{node[:nodejs][:install_to]}/node --version`.chomp == "v#{node[:nodejs][:version]}"

remote_file "#{node[:nodejs][:dest]}/#{name}.tar.gz" do
	source "http://nodejs.org/dist/v#{node[:nodejs][:version]}/#{name}.tar.gz"
	checksum node[:nodejs][:checksum]
  not_if { is_done }
end

bash "install" do
	user "root"
	cwd node[:nodejs][:dest]
	code <<-EOH
    rm -fr #{name}
		tar -xf #{name}.tar.gz
	EOH
  not_if { is_done }
end

link "#{node[:nodejs][:install_to]}/node" do
  to "#{node[:nodejs][:dest]}/#{name}/bin/node"
  not_if { is_done }
end

link "#{node[:nodejs][:install_to]}/npm" do
  to "#{node[:nodejs][:dest]}/#{name}/bin/npm"
  not_if { is_done }
end
