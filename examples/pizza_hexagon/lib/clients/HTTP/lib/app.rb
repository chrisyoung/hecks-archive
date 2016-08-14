class PizzaHexagon
  module Clients
    module HTTP
      class App
        def self.run
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
