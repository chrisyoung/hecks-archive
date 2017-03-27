module Hecks
  module Adapters
    class DynamoDB
      module Commands
        class Read
          def initialize(id, head)
            File.dirname(__FILE__)
            creds = YAML.load(File.read(File.dirname(__FILE__) + '/../../aws_config'))
            @dynamodb = Aws::DynamoDB::Client.new(region: 'us-east-1')
            @id = id
            @head = head
          end

          def call
            result = get_item
            return nil if result.nil?
            PizzaBuilder::Domain::Pizzas.head.new(result)
          end

          private

          attr_reader :dynamodb, :head

          def get_item
            symbolize(
            dynamodb.get_item(
              key: { id: @id },
              table_name: head.name
            ).item)
          end

          def symbolize(obj)
            return obj.inject({}){|memo,(k,v)| memo[k.to_sym] =  symbolize(v); memo} if obj.is_a? Hash
            return obj.inject([]){|memo,v    | memo           << symbolize(v); memo} if obj.is_a? Array
            return obj
          end
        end
      end
    end
  end
end
