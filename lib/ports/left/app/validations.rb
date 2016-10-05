# frozen_string_literal: true
require 'json-schema'

module Hecks
  module Ports
    class App
      class Validations
        attr_reader :errors, :args

        def initialize(command: nil, args: nil, module_name:, domain:)
          @command = command
          @domain  = domain
          @args    = args || command.args
          @module_name = module_name
        end

        def call
          fetch_schema
          validate
          self
        end

        def name
          return command.name if command
          self.class.to_s.split('::').last.underscore
        end

        private

        attr_accessor :command, :domain, :module_name, :schema

        def fetch_schema
          @schema = domain.schemas(module_name: module_name, command: command.name)
        end

        def validate
          @errors = JSON::Validator.fully_validate(schema, args)
        end
      end
    end
  end
end
