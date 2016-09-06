module PizzasHexagon
  module Ports
    class App
      class Validations
        attr_reader :errors, :args

        def initialize(command, **args)
          @command = command
          @args    = args || command.args
        end

        def call
          validate
          self
        end

        private

        def validate
          @errors = Schemas::Pizzas::Create.(args).messages
        end
      end
    end
  end
end
