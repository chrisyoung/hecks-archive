module PizzaServerXHexagon
  module Ports
    class App
      class Validations
        attr_reader :errors, :args

        def initialize(command = nil, args=nil)
          @command = command
          @args    = args || command.args
        end

        def call
          validate
          self
        end

        private

        attr_accessor :command

        def validate
          @errors = Schemas.fetch(command: command).(args).messages
        end
      end
    end
  end
end