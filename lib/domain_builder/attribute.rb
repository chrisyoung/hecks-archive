module Hecks
  class DomainBuilder
    class Attribute
      def initialize(string)
        @name = string[0]
        @type = string[1]
      end

      def list?
        @type.include?("[")
      end

      def name
        @name
      end

      def type
        split_type.last.delete("[").delete("]")
      end

      def domain_module
        split_type.first.delete("[").delete("]") if @type.include?("::")
      end

      private

      def split_type
        @type.split("::")
      end
    end
  end
end
