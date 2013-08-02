name             'nodejs'
maintainer       'Ian Hansen'
maintainer_email 'ian supershabam com'
license          'MIT'
description      'Installs nodejs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "nodejs", "Installs nodejs from npmjs.org binary tarball"

%w{ debian ubuntu centos redhat }.each do |os|
  supports os
end
