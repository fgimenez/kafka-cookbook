%w[zookeeper kafka_broker].each do |prg|
  template "/etc/init.d/#{prg}" do
    source "#{prg}_init_script.erb"
    mode "0755"
    variables({install_dir: node['kafka_broker']['install_dir']})
  end

  service prg do
    action [:start, :enable]
  end
end
