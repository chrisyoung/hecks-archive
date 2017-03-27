module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Create
          attr_reader :id

          def initialize(args, head, client)
            @args = args
            @head = head
            @client = client
          end

          def call
            put_item
            self
          end

          private

          attr_reader :client, :args, :head

          def put_item
            @id = SecureRandom.uuid
            client.put_item({
              item: args.merge(id: @id),
              return_consumed_capacity: 'TOTAL',
              table_name: head.name
            })
          end

          def create_table
            client.create_table(
              attribute_definitions: [
                { attribute_name: 'id', attribute_type: 'S' }
              ],
              table_name: head.name,
              key_schema: [
                { attribute_name: 'id', key_type: 'HASH' }
              ],
              provisioned_throughput: { read_capacity_units: 5, write_capacity_units: 5 }
            )
          end
        end
      end
    end
  end
end
