%w[apt java kafka_broker::structure kafka_broker::resources kafka_broker::services].each do |rcp|
  include_recipe rcp
end
