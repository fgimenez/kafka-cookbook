default['kafka_broker']['version'] = '0.8.0'
default['kafka_broker']['scala_version'] = '2.8.0'

default['kafka_broker']['tarball_url'] = "http://apache.rediris.es/kafka/#{node['kafka_broker']['version']}/kafka_#{node['kafka_broker']['scala_version']}-#{node['kafka_broker']['version']}.tar.gz"

default['kafka_broker']['install_dir'] = "/usr/local/kafka"

default['kafka_broker']['build_command'] = './sbt && ./sbt package && ./sbt assembly-package-dependency'
