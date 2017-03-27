module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Update
          def initialize(id, attributes)
            @attributes = attributes
            creds = YAML.load(File.read(File.dirname(__FILE__) + '/../../aws_config'))

            @dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')

            @id = id

          end

          def call
            update_item
            self
          end

          private

          def update_item
            # This example updates an item in the Music table. It adds a new attribute (Year) and modifies the AlbumTitle attribute.  All of the attributes in the item, as they appear after the update, are returned in the response.

            @dynamodb.update_item(
              expression_attribute_names: {
                "#AT" => "name",
              },
              expression_attribute_values: {
                ":t" => "ComeAgainPizza"
              },
              table_name: 'Pizza',
              key: { id: @id },
              return_values: "ALL_NEW",
              update_expression: "Set #AT = :t"
            )
          end
        end
      end
    end
  end
end
