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
        split_type.last.delete("[").delete("]").camelize
      end

      def domain_module
        split_type.first.delete("[").delete("]").camelize if @type.include?("::")
      end

      def ==(object_to_compare)
        return false if object_to_compare.name != name
        return false if object_to_compare.type != type
        return false if object_to_compare.domain_module != domain_module
        true
      end


      private

      def split_type
        @type.split("::")
      end
    end
  end
end
