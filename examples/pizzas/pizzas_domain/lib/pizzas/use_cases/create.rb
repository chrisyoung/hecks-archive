module Pizzas
  module Domain
    module Pizzas
      module UseCases
        class Create
          attr_accessor :args, :id, :errors

          def initialize(
            args:,
            repository:  Repository,
            events_port: nil)
            @args          = args
            @repository    = repository
            @events_port   = events_port
          end

          def call(use_case=nil)
            create
            notify_listeners
            self
          end

          def to_h
            { errors: errors, id: repository_result, args: args }
          end

          private

          attr_reader :repository, :repository_result, :events_port

          def notify_listeners
            return unless events_port
            events_port.send(:pizzas_create, command: self)
          end

          def create
            notify_listeners
            @id = @repository_result = repository.create(args)
          end
        end
      end
    end
  end
end
