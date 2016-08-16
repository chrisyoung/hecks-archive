require_relative 'route_generator'

class PizzaHexagon
  module Clients
    module HTTP
      class App
        def initialize(route_generator: RouteGenerator.new)
          @route_generator = route_generator
        end

        def run
          build_routes
        end

        private

        attr_reader :route_generator

        def build_routes
          route_generator.call
        end
      end
    end
  end
end
