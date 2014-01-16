name             'kafka_broker'
maintainer       'Federico Gimenez Nieto'
maintainer_email 'fgimenez@coit.es'
license          'Apache-2.0'
description      'Installs/Configures Apache Kafka broker'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w[ubuntu debian].each do |os|
  supports os
end

depends 'apt'
depends 'java'

