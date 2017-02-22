# frozen_string_literal: true
require_relative 'methods/create'
require_relative 'methods/read'
require_relative 'methods/update'
require_relative 'methods/delete'

module Hecks
  module Adapters
    class ResourceServer
      class Methods
        attr_reader :create, :read, :update, :delete

        def initialize(application_adapter:)
          @create = Create.new(application_adapter: application_adapter)
          @read   = Read.new(application_adapter: application_adapter)
          @update = Update.new(application_adapter: application_adapter)
          @delete = Delete.new(application_adapter: application_adapter)
        end
      end
    end
  end
end
