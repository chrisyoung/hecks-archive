module HecksDomain
  module CLI
    class GenerateDomainObject
      # Generates options in templates
      class OptionFormatter
        def initialize(attributes, optional_attributes=[], read_only_attributes=[])
          @optional_attributes = optional_attributes
          @read_only_attributes = read_only_attributes

          @attributes = attributes.map do |attribute|
            attribute = HecksDomainBuilder::Attribute.new(attribute)

            if optional_attributes.include?(attribute.name)
              attribute.optional = true
            end

            if read_only_attributes.include?(attribute.name)
              attribute.read_only = true
            end

            attribute
          end

        end

        def call(format, include_id: false)
          case format
          when 'keys_and_values'
            attributes(include_id).map { |attribute| (attribute.name + ': ' + attribute.name) }.join(', ')
          when 'attribute_string'
            attributes(include_id).map { |attribute| ':' + attribute.name }.join ', '
          when 'param_names'
            attributes(include_id).map do |attribute|
              attribute.name + ':' + (attribute.optional? ? ' nil' : '') unless attribute.read_only?
            end.compact.join ', '
          end
        end

        private

        def attributes(include_id)
          if include_id
            @attributes + [HecksDomainBuilder::Attribute.new('id:value')]
          else
            @attributes
          end
        end
      end
    end
  end
end
