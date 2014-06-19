maintainer       'Locomote'
maintainer_email 'devs@locomote.com'
license          'BSD'
description      'Chef LWRP to manage syschecks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.2'

%w{ubuntu debian redhat centos gentoo}.each { |os| supports os }
