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
          end

          def call
            create
            self
          end

          def to_h
            { errors: errors, id: repository_result, args: args }
          end

          private

          attr_reader :repository, :repository_result, :chained_command

          def create
            @id = @repository_result = repository.create(args)
          end
        end
      end
    end
  end
end
