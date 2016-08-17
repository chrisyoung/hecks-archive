require 'rack'
require 'pry'
require 'json'

require_relative '../../../pizza_hexagon'
require_relative 'lib/resource'
require_relative 'lib/app'

class PizzaHexagon
  module Clients
    module HTTP
      class Server
        def initialize(
          resource:,
          hexagon:  PizzaHexagon.new,
          response: Rack::Response.new)
          @hexagon  = hexagon
          @resource = resource
          @response = response
        end

        def call(env)
          @request = Rack::Request.new(env)

          case @request.request_method
          when 'POST'
            create_resource
            write_response
          end
          set_status
          finish_response
        end

        private

        attr_reader :hexagon, :resource, :request, :command, :response

        def set_status
          response.status = 500 if command.errors.count > 0
        end

        def finish_response
          response.finish
        end

        def write_response
          response.write(id: command.id, errors: command.errors)
        end

        def create_resource
          @command = hexagon.run(
            resource.to_param,
            :create_pizza,
            JSON.parse(request.body.read, :symbolize_names => true)
          )
        end
      end
    end
  end
end
