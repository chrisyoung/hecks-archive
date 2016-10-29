require 'sequel'

DB = Sequel.connect(
  adapter:  'mysql2',
  user:     'root',
  host:     'localhost',
  database: 'pizza_builder',
  password: "password"
)

DB.create_table? :pizzas do
  primary_key :id
  String :name
  String :description
end

DB.create_table? :pizza_toppings do
  primary_key :id
  Integer :pizza_id
  Integer :topping_id
end

DB.create_table? :toppings do
  primary_key :id
  String :name
end

class Pizza < Sequel::Model
end

class Topping < Sequel::Model
end

class PizzaTopping < Sequel::Model
end

class Repo
  def create(pizza_attributes)
    toppings = pizza_attributes.delete(:toppings)
    pizza = Pizza.create(pizza_attributes)

    toppings.each do |topping_attributes|
      topping = Topping.create(topping_attributes)
      PizzaTopping.create({
        pizza_id: pizza.id,
        topping_id: topping.id
      })
    end
  end
end

module Hecks
  module Adapters
    class SQLDatabase
      def initialize(domain)
        @domain = domain
      end

      def [](repository_name)
        Repo.new
      end
    end
  end
end
