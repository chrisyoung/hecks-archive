# frozen_string_literal: true
module HecksAdapters
  class ResourceServer < Sinatra::Base
    class Methods
      # Create a resource
      class Create
        attr_reader :result

        def initialize(application_adapter:)
          @application_adapter = application_adapter
        end

        def call(body:, module_name:)
          @body        = body.read
          @module_name = module_name.to_sym
          run_command
          build_json
          self
        end

        def status
          return 500 if command_result.errors.count.positive?
          200
        end

        private

        attr_reader :application_adapter, :body, :module_name, :command_result

        def build_json
          @result = JSON.generate(command_result.to_h)
        end

        def run_command
          @command_result = application_adapter.call(
            module_name: module_name,
            command_name: :create,
            args:        params
          )
        end

        def params
          JSON.parse(body, symbolize_names: true)
        end
      end
    end
  end
end
