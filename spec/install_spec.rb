require_relative 'spec_helper'

describe 'kafka_broker::install' do
  let(:install_dir) {"install_dir"}
  let(:build_command) {"build_command"}
  
  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['install_dir'] = install_dir
      node.set[described_cookbook]['build_command'] = build_command
    end
    runner.converge(described_recipe)
  end

  it "executes the build command" do
    expect(runner).to run_execute(build_command).
                       with(cwd: install_dir, returns: [0, 137])
  end
end
