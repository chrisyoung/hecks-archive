module PizzasHexagon
  module Ports
    class Events
      def initialize(listeners: [])
        @listeners = listeners
      end

      def send(event:, command:)
        listeners.each do |listener|
          next unless listener.respond_to?(event)
          listener.public_send(event, command)
        end
      end

      private

      attr_reader :listeners
    end
  end
end
