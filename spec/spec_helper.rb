# frozen_string_literal: true
ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'

require 'simplecov'
require 'pry'
require_relative 'sinatra_helper'
require_relative '../hecks-examples/pizza_builder/lib/pizza_builder'
require_relative '../hecks-adapters/hecks-adapters-sql-database/lib/hecks-adapters-sql-database'
require_relative '../hecks-adapters/hecks-adapters-resource-server/lib/hecks-adapters-resource-server'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
