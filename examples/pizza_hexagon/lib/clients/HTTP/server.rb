require 'rack'
require 'pry'

require_relative '../../../pizza_hexagon'
require_relative 'lib/resource'
require_relative 'lib/app'

class PizzaHexagon
  module Clients
    module HTTP
      class Server
        def initialize(resource:, hexagon: PizzaHexagon.new)
          @hexagon  = hexagon
          @resource = resource
          @response = Rack::Response.new
        end

        def call(env)
          @request = Rack::Request.new(env)
          create_resource
          write_response
        end

        private

        attr_reader :hexagon, :resource, :request, :command

        def write_response
          @response.write(id: @command.id, errors: @command.errors)
          @response.finish
        end

        def create_resource
          @command = hexagon.run(resource.to_param, :create_pizza, request.params)
        end
      end
    end
  end
end
