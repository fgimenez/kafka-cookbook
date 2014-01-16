default['kafka_broker']['version'] = '0.8.0'
default['kafka_broker']['tarball_url'] = "http://apache.rediris.es/kafka/#{node['kafka_broker']['version']}/kafka-#{node['kafka_broker']['version']}-src.tgz"

default['kafka_broker']['base_install_dir'] = '/usr/local'
default['kafka_broker']['install_dir'] = "#{node['kafka_broker']['base_install_dir']}/kafka"

default['kafka_broker']['build_command'] = './sbt && ./sbt package && ./sbt assembly-package-dependency'
