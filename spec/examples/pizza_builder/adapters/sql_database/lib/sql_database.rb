require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'sequel'
require 'hecks'

require_relative '../../../lib/pizza_builder'

load '../../Domain'

DB = Sequel.connect(ENV["DATABASE_URL"])

module PizzaBuilder
  module Adapters
    class SQLDatabase
      def initialize(domain:)
        @domain = domain
      end

      def [](module_name)
        Hecks::Adapters::SQLDatabase::Repository.new(module_name: module_name)
      end
    end
  end
end
