module HecksDomain
  module CLI
    class GenerateDomainObject
      # Generates options in templates
      class OptionFormatter
        def initialize(attributes)
          @attributes = attributes.map do |attribute|
            HecksDomainBuilder::Attribute.new(attribute)
          end
        end

        def call(format, include_id: false)
          case format
          when 'keys_and_values'
            attributes(include_id).map { |attribute| (attribute.name + ': ' + attribute.name) }.join(', ')
          when 'attribute_string'
            attributes(include_id).map { |attribute| ':' + attribute.name }.join ', '
          when 'param_names'
            attributes(include_id).map { |attribute| attribute.name + ':' }.join ', '
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
