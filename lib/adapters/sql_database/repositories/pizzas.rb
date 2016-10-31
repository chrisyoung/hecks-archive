module Hecks
  module Adapters
    class SQLDatabase
      module Repositories
        class Pizzas
          def create(pizza_attributes)
            Commands::Create.new(pizza_attributes).call
          end

          def update(id, pizza_attributes)
            Commands::Update.new(id, pizza_attributes).call
          end

          def read(id)
            Queries::Read.new(id).call
          end
        end
      end
    end
  end
end
