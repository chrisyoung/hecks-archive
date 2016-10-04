module Hecks
  module Adapters
    module Right
      module Database
        class Memory
          def initialize(domain:)
            @repositories = domain.repositories
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
end
