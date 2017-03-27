module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Create
          attr_reader :id

          def initialize(args, head)
            @args = args
            @head = head

            File.dirname(__FILE__)
            creds = YAML.load(File.read(File.dirname(__FILE__) + '/../../aws_config'))

            @dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')
          end

          def call
            put_item
            self
          end

          private

          attr_reader :dynamodb, :args, :head

          def put_item
            @id = SecureRandom.uuid
            dynamodb.put_item({
              item: args.merge(id: @id),
              return_consumed_capacity: 'TOTAL',
              table_name: head.name
            })
          end

          def create_table
            dynamodb.create_table(
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
