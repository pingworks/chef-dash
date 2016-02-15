name             'chef-dash'
maintainer       'Alexander Birk/Christoph Lukas/ Jakub Błaszczyk'
maintainer_email 'info@pingworks.de'
license          'Apache License, Version 2.0'
description      'Installs/Configures chef-dash'
long_description 'Installs/Configures chef-dash'
version '0.4.0'

supports 'debian'

depends 'apt'
depends 'apache2', '~> 2.0.0'
depends 'php', '~> 1.5.0'
