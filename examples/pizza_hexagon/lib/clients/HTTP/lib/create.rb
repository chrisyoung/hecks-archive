class PizzaHexagon
  module Clients
    module HTTP
      class Create
        def initialize(hexagon: PizzaHexagon.new, response: Rack::Response.new)
          @hexagon  = hexagon
          @response = response
        end

        def call(resource, params)
          @resource = resource
          @params   = params
          run_command
          write_response
          finish_responding
        end

        private

        attr_reader :hexagon, :response, :resource, :params, :command

        def run_command
          @command = hexagon.run(resource.to_param, :create_pizza, params)
        end

        def write_response
          response.write(command.id)
        end

        def finish_responding
          response.finish
        end
      end
    end
  end
end
