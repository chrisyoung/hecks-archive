# frozen_string_literal: true
module Hecks
  module Adapters
    class Events
      def initialize(listeners: [])
        @listeners = listeners
      end

      def send(module_name:, command:)
        @command = command
        @module_name = module_name
        listeners.each do |listener|
          next unless listener.respond_to?(event_name)
          listener.public_send(event_name, command)
        end
      end

      private

      attr_reader :listeners, :command, :module_name

      def event_name
        "#{module_name}_#{command.name}".to_sym
      end
    end
  end
end
