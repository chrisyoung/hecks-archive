module Pizzas
  module Domain
    module Pizzas
      module UseCases
        class Update
          attr_accessor :args, :errors, :id

          def initialize(
            args:,
            repository: Repository)
            @args         = args
            @id           = args[:id]
            @repository   = repository
          end

          def call(use_case=nil)
            update
            self
          end

          def to_h
            { id: id, args: args }
          end

          private

          attr_accessor :repository

          def update
            repository.update(args[:id], args[:attributes])
          end
        end
      end
    end
  end
end
