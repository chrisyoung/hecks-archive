class PizzaHexagon
  module Clients
    module HTTP
      class RouteGenerator
        class CreateRoutes
          def initialize(builder)
            @builder = builder
          end

          def call
            Domain.modules.each do |domain_module|
              resource = Resource.new(domain_module)
              builder.map "/#{resource.name}" do |builder|
                builder.run Server.new(resource: resource)
              end
            end
          end

          private

          attr_reader :builder

        end
      end
    end
  end
end
