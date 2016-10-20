# frozen_string_literal: true
module Hecks
  module Adapters
    module ResourceServer
      class Methods
        class Delete
          def initialize(application_adapter:)
            @application_adapter = application_adapter
          end

          def call(id:, module_name:)
            @id          = id.to_i
            @module_name = module_name.to_sym
            run_command
            [JSON.generate(command_result.to_h) + "\n\n"]
          end

          def status
            return 500 if command_result.errors.count.positive?
            200
          end

          private

          attr_reader :application_adapter, :module_name, :id, :command_result

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
end
