module Pizzas
  module Domain
    module Pizzas
      module UseCases
        class Delete
          attr_accessor :args

          def initialize(args:, repository: Repository)
            @args        = args
            @repository    = repository
          end

          def call(use_case=nil)
            delete
            self
          end

          def errors
            []
          end

          def to_h
            { errors: errors, args: args }
          end

          private

          attr_accessor :command_result, :repository

          def delete
            repository.delete(args[:id])
          end
        end
      end
    end
  end
end
