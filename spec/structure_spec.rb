require_relative 'spec_helper'

describe 'kafka_broker::structure' do
  let(:base_install_dir) {'base_install_dir'}

  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['base_install_dir'] = base_install_dir
    end
    runner.converge(described_recipe)
  end

  it 'creates the base install dir' do
    expect(runner).to create_directory(base_install_dir).with(recursive: true)
  end
end
