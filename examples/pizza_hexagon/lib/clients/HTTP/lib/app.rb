class PizzaHexagon
  module Clients
    module HTTP
      class App
        def initialize(builder: Rack::Builder)
          @builder = builder
        end

        def run
          generate_resource_creation_routes
        end

        private

        attr_reader :builder

        def generate_resource_creation_routes
          builder.new do
            Domain.modules.each do |constant_name|
              resource = Resource.new(constant_name)
              map "/#{resource.name}" do
                run Server.new(resource: resource)
              end
            end
          end
        end
      end
    end
  end
end
