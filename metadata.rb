name             'chef-dash'
maintainer       'Alexander Birk/Christoph Lukas'
maintainer_email 'info@pingworks.de'
license          'Apache License, Version 2.0'
description      'Installs/Configures chef-dash'
long_description 'Installs/Configures chef-dash'
version '0.1.1'

supports 'debian'

# we need that so that the system will do an "apt-get update" upfront
depends 'apt'

depends 'apache2'
depends 'php'