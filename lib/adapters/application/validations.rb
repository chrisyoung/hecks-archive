# frozen_string_literal: true
require 'json-schema'
require_relative 'schemas/delete.rb'

module Hecks
  module Adapters
    class Application
      class Validations
        attr_reader :errors, :args

        def initialize(command: nil, args: nil, module_name:, domain:)
          @command     = command
          @domain      = domain
          @module_name = module_name
          @args        = args || command.args
        end

        def call
          fetch_schema
          validate
          self
        end

        private

        attr_accessor :command, :domain, :module_name, :schema

        def fetch_schema
          @schema = if Schemas.constants.include?(command.name.camelize.to_sym)
            Schemas.const_get(command.name.camelize.to_sym)
          else
            domain.schemas(module_name: module_name)::Head
          end
        end

        def validate
          @errors = JSON::Validator.fully_validate(schema, args)
        end
      end
    end
  end
end
