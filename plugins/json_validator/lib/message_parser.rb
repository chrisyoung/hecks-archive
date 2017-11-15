module HecksPlugins
  class JSONValidator
    class MessageParser
      attr_reader :message, :field_name

      def initialize(matcher:, error:)
        @matcher = matcher
        @error = error
        @match = error.match(matcher[:regex])
      end

      def call
        parse_match
        self
      end

      private

      attr_reader :match, :matcher, :error

      def parse_match
        return unless match
        @message = matcher[:message]
        @message = message % match[2..-1] if match.length > 2
        @field_name = match[1].to_sym
      end
    end
  end
end
