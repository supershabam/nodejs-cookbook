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

nodejs_filename = "node-#{node[:nodejs][:version]}-linux-#{node[:nodejs][:architecture]}"

remote_file "/tmp/#{nodejs_filename}.tar.gz" do
	source "http://nodejs.org/dist/#{node[:nodejs][:version]}/#{nodejs_filename}.tar.gz"
	checksum node[:nodejs][:checksum]
end

bash "install_nodejs" do
	user "root"
	cwd "/tmp"
	code <<-EOH
		tar -zxf #{nodejs_filename}.tar.gz
		rm -fr /usr/local/src/#{nodejs_filename}
		mv #{nodejs_filename} /usr/local/src/
	EOH
end

link "/usr/local/bin/node" do
	to "/usr/local/src/#{nodejs_filename}/bin/node"
end

link "/usr/local/bin/npm" do
	to "/usr/local/src/#{nodejs_filename}/bin/npm"
end
