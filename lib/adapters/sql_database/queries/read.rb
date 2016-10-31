module Hecks
  module Adapters
    class SQLDatabase
      module Queries
        class Read
          def initialize(id)
            @id = id
          end

          def call
            Models::Pizza.where(id: id)
          end

          private

          attr_reader :id
        end
      end
    end
  end
end
