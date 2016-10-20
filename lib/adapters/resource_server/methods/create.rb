# frozen_string_literal: true
module Hecks
  module Adapters
    module ResourceServer
      class Methods
        class Create
          def initialize(application_adapter:)
            @application_adapter = application_adapter
          end

          def call(body:, module_name:)
            @body        = body.read
            @module_name = module_name.to_sym
            run_command
            [JSON.generate(command_result.to_h)]
          end

          private

          attr_reader :application_adapter, :body, :module_name, :command_result

          def status
            return 500 if command_result.errors.count.positive?
            200
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
end
