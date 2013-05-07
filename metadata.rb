name             'dotfiles'
maintainer       'linyows'
maintainer_email 'linyows@gmail.com'
license          'All rights reserved'
description      'Installs/Configures dotfiles'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

%w(centos redhat fedora ubuntu debian).each { |os| supports os }
%w(git).each { |cookbook| depends cookbook }
