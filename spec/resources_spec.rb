require_relative 'spec_helper'

describe 'kafka_broker::resources' do
  let(:install_dir) {'/usr/local/kafka'}
  let(:base_install_dir) {File.dirname(install_dir)}
  let(:tarball_url) {'http://url'}
  let(:version) {'version'}
  let(:scala_version) {'scala_version'}
  let(:tarball_file_base) {"kafka_#{scala_version}-#{version}"}
  let(:tarball_file) {"#{tarball_file_base}.tar.gz"}
  let(:tarball_file_path) {"#{base_install_dir}/#{tarball_file}"}
    
  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['install_dir'] = install_dir
      node.set[described_cookbook]['tarball_url'] = tarball_url
      node.set[described_cookbook]['version'] = version
      node.set[described_cookbook]['scala_version'] = scala_version
    end
    runner.converge(described_recipe)
  end

  it 'downloads the tarball' do
    expect(runner).to create_remote_file_if_missing(tarball_file_path).
                       with(source: tarball_url)
  end

  it 'extracts the tarball contents' do
    expect(runner).to run_execute("tar -zxvf #{tarball_file}").
                       with(cwd: base_install_dir)
  end

  it 'symlinks the sources directory' do
    expect(runner).to create_link(install_dir).
                       with(to: "#{base_install_dir}/#{tarball_file_base}")
  end

  it 'removes the tarball file' do
    expect(runner).to delete_file(tarball_file_path)
  end

  it 'creates the logs directory' do
    expect(runner).to create_directory("#{install_dir}/logs")
  end
end
