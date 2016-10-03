module Hecks
  module Adapters
    module Database
      class Memory
        def initialize(domain:)
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
