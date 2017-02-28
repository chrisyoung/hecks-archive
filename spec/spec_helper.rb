# frozen_string_literal: true
require 'simplecov'
require 'pry'
SimpleCov.start do
  add_filter "/examples/"
end

require_relative 'hexagon_helper'
require_relative 'sinatra_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
