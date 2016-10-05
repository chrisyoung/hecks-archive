require_relative '../lib/hecks/'
if ENV['GENERATE']
  puts 'Generating Pizza Server...'
  `cd spec && rm -rf pizza_server`
  `cd spec && ../bin/hecks new -n pizza_server -s pizza_server_schema.json`
  puts 'Done!'
end

require_relative 'pizza_server/lib/pizza_server'

require 'rack/test'
require 'rspec'
require 'pry'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end
end
