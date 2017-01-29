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
        split_name
      end

      def type
        split_type.last.delete("[").delete("]")
      end

      def domain_module
        split_type.first.delete("[").delete("]") if @string.include?("::")
      end

      private

      def split_type
        unless @string.include?("[")
          @string.split(/\w:(\w.+)/).last.split("::")
        else
          split_list_type
        end
      end

      def split_name
        unless @string.include?("[")
          @string.split(/(.+\w):\w/)[1]
        else
          split_list_name
        end
      end

      def split_list_type
        @string.split(/:\[(\w.+)/).last.split("::")
      end

      def split_list_name
        @string.split(/(.+):\[/)[1].split(':')[0]
      end
    end
  end
end
