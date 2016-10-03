module Hecks
  module Ports
    module Left
      class App
        module Commands
          class Create
            attr_accessor :args, :id, :errors

            def initialize(chained_command = nil, args: nil, repository: Repository)
              @chained_command = chained_command
              @repository      = repository

              @args            = args || chained_command.args
              @errors          = []
            end

            def repository
              return @repository unless chained_command.respond_to?(:repository)
              chained_command.repository || @repository
            end

            def call
              call_chained_command
              create
              self
            end

            def to_h
              { errors: errors, id: repository_result, args: args }
            end

            def name
              self.class.to_s.split("::").last.underscore
            end

            private

            attr_reader :repository_result, :chained_command

            def call_chained_command
              return unless chained_command
              @errors = chained_command.call.errors
            end

            def create
              return if @errors.count > 0
              @id = @repository_result = repository.create(args)
            end
          end
        end
      end
    end
  end
end
