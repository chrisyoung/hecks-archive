module Hecks
  class DomainBuilder
    class Attribute
      def initialize(string)
        @string = string
      end

      def list?
        @string.include?("[")
      end

      def name
        @string.split(":").first
      end

      def type
        @string.split(":").last.delete("[").delete("]").camelize
      end

      def domain_module
        return unless @string.include?("::")
        @string.split("::").first.split(":").last.camelize
      end
    end
  end
end
