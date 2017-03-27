module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Delete
          def initialize(id, head)
            @head = head
            @id = id
            creds = YAML.load(File.read(File.dirname(__FILE__) + '/../../aws_config'))
            @client = Aws::DynamoDB::Client.new(region: 'us-east-1')
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
