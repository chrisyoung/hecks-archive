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
        attributes.map{ |attribute| [attribute.name, attribute.type].join(':') }
      end
    end
  end
end
