module PizzaServerXHexagon
  module Domain
    module Pizzas
      module Commands
        class Delete
          attr_accessor :args, :errors

          def initialize(chained_command = nil, args: nil, repository: Repository)
            @chained_command = chained_command
            @args            = args || chained_command.args
            @repository      = repository
            @errors          = { base: [] }
          end

          def call
            call_chained_command
            delete
            self
          end

          def name
            CommandName.new(self)
          end

          def repository
            return @repository unless chained_command.respond_to?(:repository)
            chained_command.repository || @repository
          end

          def to_h
            { errors: errors, args: args }
          end

          private

          attr_accessor :command_result, :repository, :chained_command

          def delete
            @result = repository.delete(args[:id])
            @errors[:base] << "cound not find #{args[:id]}" unless @result
          end

          def call_chained_command
            return unless chained_command
            @errors.merge(chained_command.call.errors)
          end
        end
      end
    end
  end
end
