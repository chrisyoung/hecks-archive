module PizzasHexagon
  module Ports
    class App
      class Validations
        attr_reader :errors, :args

        def initialize(command, **args)
          @command = command
          @args = args || command.args
        end

        def call
          validate
          self
        end

        private

        def validate
          @errors = ['go boom']
        end
      end
    end
  end
end
