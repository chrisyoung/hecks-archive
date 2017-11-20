module HecksAdapters
  class DynamoDB
    module Commands
      # Create a resource on DynamoDB
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
          @id = args[:id]
          result = client.put_item({
            item:                     args,
            return_consumed_capacity: 'TOTAL',
            table_name:               head.name
          })

        end
      end
    end
  end
end
