module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        class Read
          def initialize(id)
            @id = id
          end

          def call
            fetch_pizza
            fetch_chef
            fetch_toppings
            Pizza.new(@pizza.merge(toppings: @toppings, chef: @chef))
          end

          private

          def fetch_pizza
            @pizza = DB[:pizzas].first(id: @id)
          end

          def fetch_chef
            @chef = DB[:chefs].first(id: @pizza.delete(:chef_id))
            @chef.delete(:id)
          end

          def fetch_toppings
            binding.pry
            @toppings = DB[:pizzas_toppings].where(pizza_id: @id).map do |pizza_topping|
              binding.pry
              topping = DB[:toppings].first(id: pizza_topping[:topping_id])
              topping.delete(:id)
              topping
            end
          end
        end
      end
    end
  end
end
