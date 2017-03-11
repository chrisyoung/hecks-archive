# frozen_string_literal: true
module Hecks
  module Adapters
    class Logger
      def initialize(output: [])
        @output = output
      end

      def method_missing(name, *args, &block)
        @output << {name: name, command: args.first.to_h.to_s}.to_s
      end

      def respond_to?(name)
        true
      end
    end
  end
end
