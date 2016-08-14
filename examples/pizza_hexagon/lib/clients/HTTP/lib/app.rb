class PizzaHexagon
  module Clients
    module HTTP
      class App
        def run
          generate_resource_creation_routes
        end

        private

        def generate_resource_creation_routes
          Rack::Builder.new do
            Domain.constants.each do |constant_name|
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
