require 'rubygems'
require 'bundler/setup'
require 'pry'
require 'sequel'
require 'hecks'

require_relative 'repositories/repositories'
require_relative '../../../lib/pizza_builder'

load '../../Domain'

DB = Sequel.connect(ENV["DATABASE_URL"])

module PizzaBuilder
  module Adapters
    class SQLDatabase
      def initialize(domain:)
        @domain = domain
      end

      def [](value)
        PizzaBuilder::Domain::Pizzas::SQLRepository
      end

    end
  end
end


# require 'rubygems'
# require_relative '../../../lib/pizza_builder'

#
# client = Mysql2::Client.new(
#   host:     "localhost",
#   username: "root",
#   password: 'password'
# )
#
# module PizzaBuilder
#   module Adapters
#     class SQLDatabase
#       def initialize(args)
#       end
#
#       def [](value)
#         { pizzas: Repository.new }[value]
#       end
#
#       class Repository
#         attr_reader :id
#
#         def id
#           1
#         end
#
#         def create(args)
#           self
#         end
#       end
#     end
#   end
# end
