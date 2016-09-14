require_relative '../lib/pizaz_hexagon/'
require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.after(:each) do
    PizazHexagon::Adapters::Databases::Memory.new.delete_all
  end
end
