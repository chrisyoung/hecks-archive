module PizzasHexagon
  module Domain
    module Pizzas
      module Queries
        class FindByID
          def initialize(repository: Repository)
            @repository = repository
          end

          def call(params)
            return unless params.keys == [:id]
            @repository.read(params[:id])
          end
        end
      end
    end
  end
end
