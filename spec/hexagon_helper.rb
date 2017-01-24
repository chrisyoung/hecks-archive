# frozen_string_literal: true

require 'rack/test'
require 'pry'

require_relative '../lib/hecks/'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end

  config.before(:suite) do
    unless ENV['SKIP_DOMAIN_GENERATION']
      puts "\nRegenerating the Pizza Builder Domain.  To skip, set ENV['SKIP_DOMAIN_GENERATION']"
      puts `cd spec && rm -rf pizza_builder`
      puts `cd spec && ../bin/hecks new -n pizza_builder -s pizza_builder_schema.json`
      # puts `cd spec && ../bin/hecks new -n pizza_builder -b pizza_builder_domain_builder.rb`
    else
      puts "\nSkipping Generation: Pizza Builder Domain"
    end
    require_relative 'pizza_builder/lib/pizza_builder'
  end

end
