# frozen_string_literal: true
module Hecks
  class Application
    module Commands
      class Create
        attr_accessor :args, :id, :errors, :repository, :domain_module

        def initialize(args:, repository:, domain_module: )
          @repository      = repository
          @args            = args
          @errors          = {}
          @validator       = Hecks::Adapters::Validator
          @domain_module   = domain_module
        end

        def call
          validate
          create
          self
        end

        def to_h
          { errors: errors, id: repository_result, args: args }
        end

        def name
          self.class.to_s.split('::').last.underscore
        end

        def result
          { id: id, success: !id.nil?, errors: errors, args: args }
        end

        private

        attr_reader :repository_result

        def create
          return if @errors.count.positive?
          @id = @repository_result = repository.create(args).id
        end

        def validate
          return if @validator.nil?
          @errors = @validator.new(command: self).call.errors
        end
      end
    end
  end
end
