module Pizzas
  module Domain
    module Pizzas
      module UseCases
        class Update
          attr_accessor :args, :errors, :id

          def initialize(
            args:,
            repository: Repository,
            events_port: nil)
            @args         = args
            @id           = args[:id]
            @repository   = repository
            @events_port  = events_port
          end

          def call(use_case=nil)
            update
            notify_listeners
            self
          end

          def to_h
            { id: id, args: args }
          end

          private

          attr_accessor :repository, :events_port

          def notify_listeners
            return if events_port.nil?
            events_port.send(:pizzas_update, command: self)
          end

          def update
            repository.update(args[:id], args[:attributes])
          end
        end
      end
    end
  end
end
