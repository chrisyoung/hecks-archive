module HecksDomain
  module CLI
    # Helpful methods for supporting object creation
    class GenerateDomainObject
      class SetterTemplate
        def initialize(attributes)
          @attributes = attributes
        end

        def render
          attributes.map do |attribute|
            render_template(attribute)
          end.join("\n")
        end

        private

        attr_reader :attributes

        def render_template(attribute)
          <<~METHOD
          def #{name(attribute)}=(#{name(attribute)})
            #{AssignmentTemplate.new([attribute]).render}
          end
          METHOD
        end

        def name(attribute)
          HecksDomainBuilder::Attribute.new(attribute).name
        end
      end
    end
  end
end
