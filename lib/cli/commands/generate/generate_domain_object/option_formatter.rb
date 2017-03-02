class GenerateDomainObject
  class OptionFormatter
    def initialize(attributes, table_name)
      @table_name = table_name
      @attributes = attributes.map do |attribute|
        Hecks::DomainBuilder::Attribute.new(attribute, table_name)
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
        @attributes + [Hecks::DomainBuilder::Attribute.new('id:value', @table_name)]
      else
        @attributes
      end
    end
  end
end
