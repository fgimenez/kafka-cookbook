base_install_dir = File.dirname(node['kafka_broker']['install_dir'])
tarball_file = "kafka-#{node['kafka_broker']['version']}-src.tgz"
tarball_file_path = "#{base_install_dir}/#{tarball_file}"

remote_file tarball_file_path do
  action :create_if_missing
  source node['kafka_broker']['tarball_url']
end

execute 'unzip kafka source' do
  command "tar -zxvf #{tarball_file}"
  cwd base_install_dir
end

link node['kafka_broker']['install_dir'] do
  to "#{base_install_dir}/#{File.basename(tarball_file, File.extname(tarball_file))}"
end

file tarball_file_path do
  action :delete
end
