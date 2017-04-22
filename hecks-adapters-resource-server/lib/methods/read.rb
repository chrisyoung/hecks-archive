# frozen_string_literal: true
module HecksAdapters
  class ResourceServer < Sinatra::Base
    class Methods
      # Read a resource
      class Read
        attr_reader :result, :status
        def initialize(application_adapter:)
          @application_adapter = application_adapter
        end

        def call(id:, module_name:)
          @id          = id.to_i
          @module_name = module_name.to_sym
          run_query
          convert_to_json
          self
        end

        def status
          return 404 if command_result.nil?
          200
        end

        private

        attr_reader :application_adapter, :id, :module_name, :command_result

        def convert_to_json
          @result = command_result.to_json
        end

        def run_query
          @command_result = application_adapter.query(
            query_name:  :find_by_id,
            module_name: module_name,
            args:        { id: id }
          )
        end
      end
    end
  end
end
