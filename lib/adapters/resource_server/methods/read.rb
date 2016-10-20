# frozen_string_literal: true
module Hecks
  module Adapters
    module ResourceServer
      class Methods
        class Read
          def initialize(application_adapter:)
            @application_adapter = application_adapter
          end

          def call(id:, module_name:)
            @id          = id.to_i
            @module_name = module_name.to_sym
            run_query
            [result.to_json]
          end

          def status
            return 500 if command_result.errors.count.positive?
            200
          end

          private

          attr_reader :application_adapter, :id, :module_name, :result

          def run_query
            @result = application_adapter.query(
              query_name:       :find_by_id,
              module_name: module_name,
              args:        { id: id }
            )
          end
        end
      end
    end
  end
end
