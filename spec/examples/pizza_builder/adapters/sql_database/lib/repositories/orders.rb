module PizzaBuilder
  module Adapters
    module SQLDatabase
      module Repositories
        class Pizzas
          def self.create attributes = {}
            @last_id = Pizza.create(attributes).id
          end

          def self.update id, attributes
            pizza = Order.find(id)
            pizza.update(attributes)
          end

          def self.read id
            Orders::Order.new(Order.find(id).to_h)
          end

          def self.delete id
            pizza = Order.find(id)
            pizza.destroy
          end

          def self.delete_all
            # Not implemented
          end
        end
      end
    end
  end
end
