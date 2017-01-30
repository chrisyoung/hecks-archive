# frozen_string_literal: true

require 'rack/test'
require 'pry'

require_relative '../lib/hecks/'
require_relative 'examples/pizza_builder/lib/pizza_builder'
require_relative 'examples/soccer_season/lib/soccer_season'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end
end
