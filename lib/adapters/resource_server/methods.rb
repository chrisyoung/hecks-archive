# frozen_string_literal: true
require_relative 'methods/create'
require_relative 'methods/read'
require_relative 'methods/update'
require_relative 'methods/delete'

module PizzaServerHexagon
  module Adapters
    module ResourceServer
      class Methods
        attr_reader :create, :read, :update, :delete

        def initialize(hexagon:)
          @create = Create.new(hexagon: hexagon)
          @read   = Read.new(hexagon: hexagon)
          @update = Update.new(hexagon: hexagon)
          @delete = Delete.new(hexagon: hexagon)
        end
      end
    end
  end
end
