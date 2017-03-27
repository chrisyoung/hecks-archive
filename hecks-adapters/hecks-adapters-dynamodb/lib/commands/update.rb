module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Update
          def initialize(id, attributes, head)
            @head = head
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

          attr_reader :head, :attributes

          def update_item
            update_expression = "SET " + @attributes.map{|a| "##{a[0].upcase} = :#{a[0]}"}.join(", ")
            attribute_names = @attributes.map{|a| ["##{a[0].upcase}", a[0].to_s]}.to_h
            attribute_values = @attributes.map{|a| [":#{a[0]}", a[1]]}.to_h

            @dynamodb.update_item(
              expression_attribute_names: attribute_names,
              expression_attribute_values: attribute_values,
              table_name: @head.name,
              key: { id: @id },
              return_values: "ALL_NEW",
              update_expression: update_expression
            )
          end
        end
      end
    end
  end
end
