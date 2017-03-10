require_relative 'read/fetch_references'
module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class Read
            attr_reader :head, :entity, :table, :id

            def initialize(id, head)
              @head = head
              @table = Table.factory([@head]).first
              @id = id
            end

            def call
              fetch_entity
              @entity.merge(FetchReferences.new(self).call.reference_map)
            end

            private

            def fetch_entity
              @entity = DB[@table.name.to_sym].first(id: @id)
            end

            def fetch_chef
              @chef = DB[:chefs].first(id: @pizza.delete(:chef_id))
              @chef.delete(:id)
            end

            def fetch_toppings
              @toppings = DB[:pizzas_toppings].where(pizza_id: @id).map do |pizza_topping|
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
end
