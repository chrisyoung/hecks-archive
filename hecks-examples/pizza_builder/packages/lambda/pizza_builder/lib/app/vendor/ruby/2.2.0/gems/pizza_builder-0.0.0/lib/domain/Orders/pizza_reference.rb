module PizzaBuilder
  module Domain
    module Orders
      class PizzaReference
        attr_accessor :id, :referenced_entity

        def self.factory(group_attributes)
          return PizzaReference.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            PizzaReference.new(attributes)
          end
        end

        def initialize(id:)
          @id = id
          @referenced_entity = Pizzas::Pizza
        end

        def to_json(config)
          JSON.generate({id: @id, referenced_entity: @referenced_entity})
        end
      end
    end
  end
end
