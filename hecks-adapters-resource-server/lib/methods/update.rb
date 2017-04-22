# frozen_string_literal: true
module HecksAdapters
  class ResourceServer < Sinatra::Base
    class Methods
      # Update a resource
      class Update
        attr_reader :result

        def initialize(application_adapter:)
          @application_adapter = application_adapter
        end

        def call(id:, body:, module_name:)
          @id          = id.to_i
          @body        = body.read
          @module_name = module_name.to_sym
          run_command
          convert_to_json
          self
        end

        def status
          return 500 if command_result.errors.count.positive?
          200
        end

        private

        attr_accessor :application_adapter, :id, :body, :module_name, :command_result

        def convert_to_json
          @result = JSON.generate(command_result.to_h)
        end

        def run_command
          @command_result = application_adapter.call(
            module_name:  module_name,
            command_name: :update,
            args:         params
          )
        end

        def params
          JSON.parse(body, symbolize_names: true).merge(id: id)
        end
      end
    end
  end
end
