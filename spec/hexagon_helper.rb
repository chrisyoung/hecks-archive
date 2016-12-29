# frozen_string_literal: true

require 'rack/test'
# require 'rspec'
require 'pry'

require_relative '../lib/hecks/'

require_relative 'pizza_builder/lib/pizza_builder'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end

  config.before(:suite) do
    unless ENV['SKIP_DOMAIN_GENERATION']
      puts "\nRegenerating the Pizza Builder Domain.  To skip, set ENV['SKIP_DOMAIN_GENERATION']"
      puts `cd spec && ../bin/hecks new -f -n pizza_builder -s pizza_builder_schema.json`
    else
      puts "\nSkipping Generation: Pizza Builder Domain"
    end
  end
end
