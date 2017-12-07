module HecksDomain
  module CLI
    # Helpful methods for supporting object creation
    class GenerateDomainObject
      class SetterTemplate
        def initialize(attributes, tab_count: 0)
          @attributes = attributes
          @tab_count = tab_count
        end

        def render
          attributes.map.with_index do |attribute, i|
            render_template(attribute, indent_first_line: i == 0)
          end.join("\n")
        end

        private

        attr_reader :attributes, :tab_count

        def render_template(attribute, indent_first_line: false)
<<-METHOD
#{" " * tab_count * 2 unless indent_first_line}def #{name(attribute)}=(#{name(attribute)})
#{" " * tab_count * 2}  #{AssignmentTemplate.new([attribute]).render}
#{" " * tab_count * 2}end
METHOD
        end

        def name(attribute)
          HecksDomainBuilder::Attribute.new(attribute).name
        end
      end
    end
  end
end
