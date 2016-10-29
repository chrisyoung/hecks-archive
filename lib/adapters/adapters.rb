# frozen_string_literal: true
require_relative 'sql_database/sql_database'
Dir[File.dirname(__FILE__) + '/**/*.rb'].each { |file| require file }
