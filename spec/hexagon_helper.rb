require_relative '../lib/hecks/'
require 'rack/test'
require 'rspec'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end
end
