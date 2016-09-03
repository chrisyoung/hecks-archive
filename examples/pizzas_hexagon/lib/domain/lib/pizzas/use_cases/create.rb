module PizzasHexagon
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(chained_command=nil, args: nil, repository:  Repository)
            @repository      = repository
            @chained_command = chained_command
            @args            = args || chained_command.args
            @errors          = []
          end

          def call
            call_chained_command
            create
            self
          end

          def to_h
            { errors: errors, id: repository_result, args: args }
          end

          private

          attr_reader :repository, :repository_result, :chained_command

          def call_chained_command
            return unless chained_command
            @errors = chained_command.call.errors
          end

          def create
            rertun if @errors.count > 0
            @id = @repository_result = repository.create(args)
          end
        end
      end
    end
  end
end
