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
require 'sequel'

DB = Sequel.sqlite # memory database, requires sqlite3

DB.create_table :items do
  primary_key :id
  String :name
  Float :price
end

items = DB[:items] # Create a dataset

# Populate the table
items.insert(:name => 'abc', :price => rand * 100)
items.insert(:name => 'def', :price => rand * 100)
items.insert(:name => 'ghi', :price => rand * 100)

# Print out the number of records
puts "Item count: #{items.count}"

# Print out the average price
puts "The average price is: #{items.avg(:price)}"
