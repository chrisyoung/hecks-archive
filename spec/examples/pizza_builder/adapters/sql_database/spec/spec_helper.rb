ENV['DATABASE_URL'] ||= 'mysql2://root:password@localhost/pizza_builder_test'

require_relative '../lib/sql_database'
require 'simplecov'
require 'hecks'
require 'pry'
SimpleCov.start
