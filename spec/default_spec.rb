require_relative 'spec_helper'

describe 'kafka_broker::default' do
  let(:runner) { ChefSpec::Runner.new.converge(described_recipe) }

  %w[apt java kafka_broker::structure kafka_broker::resources kafka_broker::services].each do |rcp|
    it "includes the #{rcp} recipe" do
      expect(runner).to include_recipe(rcp)
    end
  end
end
