class GenerateDomainObject
  module AssignmentTemplate
    def self.render(attributes)
      attributes.map do |attribute|
        if attribute.domain_module && attribute.list?
          reference_list(attribute)
        elsif attribute.domain_module
          reference(attribute)
        elsif attribute.type == "Value"
          value(attribute)
        elsif attribute.list?
          list(attribute)
        else
          singular(attribute)
        end
      end.join("\n")
    end

    private

    def self.reference_list(attribute)
      "@#{attribute.name} = #{attribute.type}Reference.factory(#{attribute.name})"
    end

    def self.reference(attribute)
      "@#{attribute.name} = #{attribute.type}Reference.factory(#{attribute.name})"
    end

    def self.list(attribute)
      "@#{attribute.name} = #{attribute.type}.factory(#{attribute.name})"
    end

    def self.singular(attribute)
      "@#{attribute.name} = #{attribute.type}.factory(#{attribute.name})"
    end

    def self.value(attribute)
      "@#{attribute.name} = #{attribute.name}"
    end
  end
end
