class HecksDomainBuilder
  # A Domain Object
  class DomainObject
    attr_reader :name, :attributes

    def initialize(name:)
      @name = name
      @optional_attributes = []
    end

    def attributes(*values)
      return @attributes if @attributes
      @attributes = values.map { |value| Attribute.new(value) }
      self
    end

    def optional_attributes(*values)
      @optional_attributes = values.map { |value| Attribute.new(value) }
      values.each do |attribute_name|
        attributes.each do |attribute|
          attribute.optional = true if attribute.name == attribute_name
        end
      end
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

    def optional_attribute_string
      @optional_attributes.map do |attribute|
        [attribute.name]
      end
    end

    def references
      @attributes.reject(&:primitive?)
    end

    def domain_references
      @attributes.select(&:domain_reference?)
    end

    private

    def type_with_domain_module(attribute)
      type = Types.values.include?(attribute.type) ? "Value" : attribute.type
      type = '[' + type + ']' if attribute.list?
      return type unless attribute.domain_module
      [attribute.domain_module, type].join("::")
    end
  end
end
