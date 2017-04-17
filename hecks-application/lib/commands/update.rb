# frozen_string_literal: true
module Hecks
  class Application
    module Commands
      class Update
        attr_accessor :args, :errors, :id, :repository

        def initialize(args: nil, repository: Repository, domain_module:)
          @repository      = repository
          @args            = args
          @errors          = []
          @id              = @args.delete(:id)
        end

        def name
          self.class.to_s.split('::').last.underscore
        end

        def call
          update
          self
        end

        def result
          { id: id, errors: errors, args: args }
        end

        def to_h
          { id: id, args: args }
        end

        private

        attr_reader :repository_result

        def update
          return if @errors.count.positive?
          @repository_result = repository.update(id, args)
        end
      end
    end
  end
end
