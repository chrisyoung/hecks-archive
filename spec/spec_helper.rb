# frozen_string_literal: true
ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'
require 'simplecov'
require 'pry'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
