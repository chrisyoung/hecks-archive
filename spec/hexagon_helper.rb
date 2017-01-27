# frozen_string_literal: true

require 'rack/test'
require 'pry'

require_relative '../lib/hecks/'

RSpec.configure do |config|
  config.after(:each) do
    # Hecks::Adapters::Database::Memory.new.delete_all
  end

  config.before(:suite) do
    require_relative 'pizza_builder/lib/pizza_builder'
  end

end
