require_relative 'route_generator/create_routes'

class PizzaHexagon
  module Clients
    module HTTP
      class RouteGenerator
        def call
          build_routes
        end

        private

        def build_routes
          Rack::Builder.new do |builder|
            CreateRoutes.new(builder).call
            # ReadRoutes.new(builder).call
            # UpdateRoutes.new(builder).call
            # DeleteRoutes.new(builder).call
          end
        end
      end
    end
  end
end
