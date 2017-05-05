module HecksDomain
  module CLI
    # Helpful methods for supporting object creation
    class GenerateDomainObject
      class AssignmentTemplate
        def initialize(attributes)
          @attributes = attributes
        end

        def render
          attributes.map do |attribute|
            @attribute = HecksDomainBuilder::Attribute.new(attribute)
            do_assignment
          end.join("\n")
        end

        private

        attr_reader :attributes, :attribute

        def do_assignment
          return value_assignment if HecksDomainBuilder::Types.values.include?(@attribute.type)
          return value_assignment if @attribute.type == 'Value'
          return reference_factory_assignment if attribute.domain_module
          return factory_assignment
        end

        def reference_factory_assignment
          "@#{attribute.name} = #{attribute.type}Reference.factory(#{attribute.name})"
        end

        def factory_assignment
          "@#{attribute.name} = #{attribute.type}.factory(#{attribute.name})"
        end

        def value_assignment
          "@#{attribute.name} = #{attribute.name}"
        end
      end
    end
  end
end
