module Hecks
  module Domain
    class DomainBuilder
      class DomainObject
        attr_reader :name, :attributes

        def initialize(name:)
          @name = name
        end

        def attributes(*values)
          return @attributes if @attributes
          @attributes = values.map { |value| Hecks::Domain::DomainBuilder::Attribute.new(value) }
        end

        def attribute_hash
          attributes.map do |attribute|
            [attribute.name.to_sym, type_with_domain_module(attribute)]
          end.to_h
        end

        def attribute_string
          attributes.map do |attribute|
            [attribute.name, type_with_domain_module(attribute)].join(':')
          end
        end

        private

        def type_with_domain_module(attribute)
          type = DomainBuilder::Types.values.include?(attribute.type) ? "Value" : attribute.type
          type = '[' + type + ']' if attribute.list?
          return type unless attribute.domain_module
          [attribute.domain_module, type].join("::")
        end
      end
    end
  end
end
