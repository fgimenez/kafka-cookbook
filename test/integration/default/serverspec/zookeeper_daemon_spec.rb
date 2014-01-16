require 'spec_helper'

describe "Zookeeper Daemon" do

  it "is listening on port 2181" do
    expect(port(2181)).to be_listening
  end

end
