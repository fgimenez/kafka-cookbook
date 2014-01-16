require 'spec_helper'

describe "Kafka Daemon" do

  it "is listening on port 9092" do
    expect(port(9092)).to be_listening
  end

end
