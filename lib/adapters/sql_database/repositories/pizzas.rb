module Hecks
  module Adapters
    class SQLDatabase
      module Repositories
        class Pizzas
          def create(pizza_attributes)
            Commands::Create.new(pizza_attributes).call
          end

          def update(pizza_attributes)
            Commands::Update.new(pizza_attributes).call
          end
        end
      end
    end
  end
end
