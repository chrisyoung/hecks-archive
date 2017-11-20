# frozen_string_literal: true
module HecksAdapters
  class ResourceServer < Sinatra::Base
    class Methods
      # Delete a resource
      class Delete
        attr_reader :result

        def initialize(application_adapter:)
          @application_adapter = application_adapter
        end

        def call(id:, module_name:)
          @id          = id
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

        attr_reader :application_adapter, :module_name, :id, :command_result

        def convert_to_json
          @result = JSON.generate(command_result.to_h)
        end

        def run_command
          @command_result = application_adapter.call(
            module_name: module_name,
            command_name: :delete,
            args: { id: id }
          )
        end
      end
    end
  end
end
