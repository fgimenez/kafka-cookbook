execute "build kafka source" do
  command node['kafka_broker']['build_command']
  cwd node['kafka_broker']['install_dir']
  returns [0, 137]
end

