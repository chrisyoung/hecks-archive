module HecksDomain
  module CLI
    # Helpful methods for supporting object creation
    class GenerateDomainObject
      class AssignmentTemplate
        def initialize(attributes, tab_count: 5)
          @attributes = attributes
          @tab_count = tab_count
        end

        def render
          attributes.map.with_index do |attribute, i|
            @attribute = HecksDomainBuilder::Attribute.new(attribute)
            do_assignment(skip_tabs: i==0)
          end.join("\n")
        end

        private

        attr_reader :attributes, :attribute, :tab_count

        def do_assignment(skip_tabs: false)
          return value_assignment(skip_tabs: skip_tabs) if HecksDomainBuilder::Types.values.include?(@attribute.type)
          return value_assignment(skip_tabs: skip_tabs) if @attribute.type == 'Value'
          return reference_factory_assignment(skip_tabs: skip_tabs) if attribute.domain_module
          return factory_assignment(skip_tabs: skip_tabs)
        end

        def tabs
          ' ' * tab_count * 2
        end

        def reference_factory_assignment(skip_tabs: false)
          "#{tabs unless skip_tabs}@#{attribute.name} = #{attribute.type}Reference.factory(#{attribute.name})"
        end

        def factory_assignment(skip_tabs: false)
          "#{tabs unless skip_tabs}@#{attribute.name} = #{attribute.type}.factory(#{attribute.name})"
        end

        def value_assignment(skip_tabs: false)
          "#{tabs unless skip_tabs}@#{attribute.name} = #{attribute.name}"
        end
      end
    end
  end
end
