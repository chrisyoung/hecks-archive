module Hecks
  module Adapters
    class SQLDatabase
      module Commands
        class Delete
          def initialize(id)
            @id = id
          end

          def call
            fetch_pizza
            delete_pizza
            self
          end

          private

          attr_reader :id, :pizza

          def fetch_pizza
            @pizza = Models::Pizza.where(id: id).first
          end

          def delete_pizza
            pizza.delete
          end
        end
      end
    end
  end
end
