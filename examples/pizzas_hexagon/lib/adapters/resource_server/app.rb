module PizzasHexagon
  module Adapters
    module ResourceServer
      class App < Sinatra::Base
        def initialize(app: nil, hexagon: PizzasHexagon::App.new)
          super(app)
          @methods = Methods.new(hexagon: hexagon)
        end

        Domain.modules.each do |name|
          post "/#{name}" do
            methods.create.call(
              body:        request.body,
              module_name: name
            )
          end

          get "/#{name}/:id" do |id|
            methods.read.call(
              id:          id,
              module_name: name
            )
          end

          put "/#{name}/:id" do |id|
            methods.update.call(
              id:          id,
              body:        request.body,
              module_name: name
            )
          end

          delete "/#{name}/:id" do |id|
            methods.delete.call(
              id:          id,
              module_name: name
            )
          end
        end

        private

        attr_reader :methods
      end
    end
  end
end
