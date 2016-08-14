require_relative '../../../pizza_hexagon'
require_relative 'lib/resource'
require_relative 'lib/create'
require_relative 'lib/app'
require 'rack'
require 'pry'

class PizzaHexagon
  module Clients
    module HTTP
      class Server
        def initialize(resource:, hexagon: PizzaHexagon.new, create: Create.new)
          @hexagon  = hexagon
          @resource = resource
          @create   = create
        end

        def call(env)
          @request = Rack::Request.new(env)
          create_resource
        end

        private

        attr_reader :hexagon, :resource, :create, :request

        def create_resource
          create.call(resource, request.params)
        end
      end
    end
  end
end
