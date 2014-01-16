require_relative 'spec_helper'

describe 'kafka_broker::services' do
  let(:install_dir) {"install_dir"}
  
  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['install_dir'] = install_dir
    end
    runner.converge(described_recipe)
  end

  %w[zookeeper kafka_broker].each do |prg|
    it "should create the #{prg} init script" do
      expect(runner).to create_template("/etc/init.d/#{prg}").
                         with(variables: {install_dir: install_dir},
                              source: "#{prg}_init_script.erb", mode: "0755")
    end

    it "should enable and start the #{prg} service" do
      expect(runner).to enable_service(prg)
      expect(runner).to start_service(prg)
    end
  end
end
