require_relative 'spec_helper'

describe 'kafka_broker::resources' do
  let(:base_install_dir) {'base_install_dir'}
  let(:tarball_url) {'http://url'}
  let(:install_dir) {"#{base_install_dir}/kafka"}
  let(:version) {'version'}
  let(:tarball_file) {"kafka-#{version}-src.tgz"}
  let(:tarball_file_path) {"#{base_install_dir}/#{tarball_file}"}
  let(:tarball_file_base) {File.basename(tarball_file, File.extname(tarball_file))}
  
  let(:runner) do
    runner = ChefSpec::Runner.new do |node|
      node.set[described_cookbook]['base_install_dir'] = base_install_dir
      node.set[described_cookbook]['install_dir'] = install_dir
      node.set[described_cookbook]['tarball_url'] = tarball_url
      node.set[described_cookbook]['version'] = version
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
end
