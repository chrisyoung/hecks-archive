module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Delete
          def initialize(id)
            @id = id
            creds = YAML.load(File.read(File.dirname(__FILE__) + '/../../aws_config'))

            @dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')
          end

          def call
            delete_pizza
            self
          end

          private

          attr_reader :dynamodb

          def delete_pizza
            dynamodb.delete_item(
              key: {
                "id" => @id
              },
              table_name: "Pizza"
            )
          end
        end
      end
    end
  end
end
