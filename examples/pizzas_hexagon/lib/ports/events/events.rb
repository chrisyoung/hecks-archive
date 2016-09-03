module PizzasHexagon
  module Ports
    class Events
      def initialize(listeners: [])
        @listeners = listeners
      end

      def send(command)
        @command = command
        listeners.each do |listener|
          next unless listener.respond_to?(event_name)
          listener.public_send(event_name, command)
        end
      end

      private

      attr_reader :listeners, :command

      def event_name
        EventName.new(command).value
      end
    end
  end
end
