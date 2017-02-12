module Hecks
  class DomainBuilder
    class DomainObject
      attr_reader :name, :attributes

      def initialize(name:)
        @name = name
      end

      def attributes(*values)
        return @attributes if @attributes
        @attributes = values.map {|value| Attribute.new(value)}
      end

      def attribute_hash
        attributes.map{ |attribute| [attribute.name.to_sym, attribute.type] }.to_h
      end

      def attribute_string
        attributes.map do |attribute|
          [attribute.name, type_with_domain_module(attribute)].join(':')
        end
      end

      private

      def type_with_domain_module(attribute)
        unless attribute.domain_module
          if attribute.list?
            return '[' + attribute.type + ']'
          else
            return attribute.type
          end
        end

        if attribute.list?
          return [attribute.domain_module, '[' + attribute.type + ']'].join("::")
        else
          return [attribute.domain_module, attribute.type].join("::")
        end
      end
    end
  end
end
