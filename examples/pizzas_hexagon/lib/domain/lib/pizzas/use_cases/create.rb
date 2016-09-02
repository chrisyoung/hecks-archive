module Pizzas
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(args:, repository:  Repository)
            @args          = args
            @repository    = repository
          end

          def call(use_case=nil)
            create
            self
          end

          def to_h
            { errors: errors, id: repository_result, args: args }
          end

          private

          attr_reader :repository, :repository_result

          def create
            @id = @repository_result = repository.create(args)
          end
        end
      end
    end
  end
end
