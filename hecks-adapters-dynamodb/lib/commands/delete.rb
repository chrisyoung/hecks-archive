module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Delete
          def initialize(id, head, client)
            @head = head
            @id = id
            @client = client
          end

          def call
            delete_item
            self
          end

          private

          attr_reader :client, :head

          def delete_item
            client.delete_item(
              key: { "id" => @id },
              table_name: head.name
            )
          end
        end
      end
    end
  end
end
