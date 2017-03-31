# frozen_string_literal: true
require 'pry'
require 'webmock/rspec'
require_relative 'coverage_helper'
require_relative 'sinatra_helper'
require_relative 'hecks_helper'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
