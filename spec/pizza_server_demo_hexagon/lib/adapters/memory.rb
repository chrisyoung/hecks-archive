module PizzaServerDemoHexagon
  module Adapters
    module Databases
      class Memory
        def initialize(repositories: Domain.repositories)
          @repositories = repositories
        end

        def [] (module_name)
          @repositories[module_name]
        end

        def delete_all
          @repositories.values.each do |repository|
            repository.delete_all
          end
        end
      end
    end
  end
end
