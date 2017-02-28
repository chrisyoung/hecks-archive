require_relative 'generate_domain_migrations'
# require 'rubygems'
# require_relative '../../../lib/pizza_builder'
# require 'mysql2'
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
