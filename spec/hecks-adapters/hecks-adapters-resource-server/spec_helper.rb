# frozen_string_literal: true
require 'simplecov'

require_relative '../../hecks-examples/pizza_builder/lib/pizza_builder'
require_relative 'sinatra_helper'
require_relative '../lib/hecks-adapters-resource-server'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
