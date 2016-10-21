# frozen_string_literal: true
module Hecks
  module Adapters
    class Application
      module Commands
        class Delete
          attr_accessor :args, :errors, :repository

          def initialize(args: nil, repository: Repository)
            @args            = args || chained_command.args
            @repository      = repository
            @errors          = { base: [] }
          end

          def call
            delete
            self
          end

          def name
            self.class.to_s.split('::').last.underscore
          end

          def to_h
            { errors: errors, args: args }
          end

          private

          attr_accessor :command_result, :repository

          def delete
            @result = repository.delete(args[:id])
            @errors[:base] << "cound not find #{args[:id]}" unless @result
          end
        end
      end
    end
  end
end
