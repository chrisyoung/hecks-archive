# frozen_string_literal: true

require 'rack/test'
# require 'rspec'
require 'pry'

require_relative '../lib/hecks/'
if ENV['GENERATE']
  puts 'Generating Pizza Builder...'
  `cd spec && rm -rf pizza_builder`
  `cd spec && ../bin/hecks new -n pizza_builder -s pizza_builder_schema.json`
  puts 'Done!'
end

require_relative 'pizza_builder/lib/pizza_builder'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end
end
