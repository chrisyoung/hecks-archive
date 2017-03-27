module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Create
          attr_reader :id

          def initialize(args)
            @args = args
            @id = 'anid'

            File.dirname(__FILE__)
            creds = YAML.load(File.read(File.dirname(__FILE__) + '/../../aws_config'))

            @dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')
          end

          def call
            # create_table
            put_item
            # get_item

            self
          end

          private

          attr_reader :dynamodb, :args

          def put_item
            @id = SecureRandom.uuid
            dynamodb.put_item({
              item: args.merge(id: @id),
              return_consumed_capacity: 'TOTAL',
              table_name: "Pizza"
            })
          end

          def create_table
            dynamodb.create_table(
              attribute_definitions: [
                { attribute_name: 'id', attribute_type: 'S' }
              ],
              table_name: "Pizza",
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
