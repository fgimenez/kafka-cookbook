[![Build Status](https://travis-ci.org/fgimenez/kafka-cookbook.png)](https://travis-ci.org/fgimenez/kafka-cookbook)

Kafka Broker Cookbook
=================
This cookbook installs Apache Kafka broker. It allows installing different versions of Kafka and has been tested with 0.8.0 and 0.7.0.

Requirements
------------

It was developed on Ubuntu 12.04 but should work on any platform where Java 1.6 works. 

The java cookbook is needed, as usual may be handled with Berkshelf. 

Attributes
----------
* node['kafka_broker']['version']: Kafka version to be installed, the cookbook has been tested with 0.8.0
* node['kafka_broker']['scala_version']: Scala version for the binary download, the cookbook has been tested with 2.8.0
* node['kafka_broker']['tarball_url']: Where to obtain Kafka's source
* node['kafka_broker']['install_dir']: Where to install Kafka
* node['kafka_broker']['build_command']: Command to build from source

Running the tests
-----------------

This is done thanks to berkshelf and strainer:

    $ bundle
    $ bundle exec berks install
    $ bundle exec strainer test

For Testkitchen related tests:

    $ bundle
    $ bundle exec kitchen verify
    
Vagrant usage
-------------

For testing the cookbook with Vagrant 1.2+ you just have to execute bootstrap.sh:

    $ bootstrap.sh

It installs the required Vagrant plugins and launchs the machine. After the process you have a Kafka broker instance running in ```kafka.local``` host, ip 33.33.33.33 (you may need to provide root privileges to allow vagrant-hostmanager link the previous hostname and ip address).

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

License and Authors
-------------------
MIT License

Authors: Federico Gimenez Nieto <fgimenez@coit.es>


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/fgimenez/kafka-cookbook/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

