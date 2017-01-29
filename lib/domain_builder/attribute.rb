module Hecks
  class DomainBuilder
    class Attribute
      attr_reader :name, :type, :domain_module

      def initialize(string)
        @string = string
        parse
      end

      def list?
        @string.include?("[")
      end

      private

      def split_type
        unless @string.include?("[")
          @string.split(/\w:(\w.+)/).last.split("::")
        else
          @string.split(/:\[(\w.+)/).last.split("::")
        end
      end

      def split_name
        unless @string.include?("[")
          @string.split(/(.+\w):\w/)[1]
        else
          split_list_name
        end
      end

      def split_list_name
        @string.split(/(.+):\[/)[1].split(':')[0]
      end

      def parse
        @name = split_name
        @type = split_type.last.delete("[").delete("]")
        @domain_module = split_type.first.delete("[").delete("]") if @string.include?("::")
      end
    end
  end
end
