require_relative 'spec_helper'

describe 'kafka_broker::structure' do
  let(:install_dir) {'/usr/local/kafka'}

  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['install_dir'] = install_dir
    end
    runner.converge(described_recipe)
  end

  it 'creates the base install dir' do
    expect(runner).to create_directory(File.dirname(install_dir)).with(recursive: true)
  end
end
