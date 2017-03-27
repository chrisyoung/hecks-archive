require_relative 'commands/create'
require_relative 'commands/read'
require_relative 'commands/update'
require_relative 'commands/delete'

module Hecks
  module Adapters
    class DynamoDB
      class Repository
        attr_reader :id

        def initialize(head)
          @head = head
        end

        def create(args)
          Commands::Create.new(args, @head).call
        end

        def delete(id)
          Commands::Delete.new(id, @head).call
        end

        def read(id)
          Commands::Read.new(id, @head).call
        end

        def update(id, attributes)
          Commands::Update.new(id, attributes, @head).call
        end
      end
    end
  end
end
