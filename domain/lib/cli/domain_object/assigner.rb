module HecksDomain
  module CLI
    # Helpful methods for supporting object creation
    class GenerateDomainObject
      class Assigner
        def initialize(skip_tabs:, tab_count:, attribute:)
          @skip_tabs = skip_tabs
          @tab_count = tab_count
          @attribute = attribute
        end

        def render
          return value_assignment(skip_tabs: skip_tabs) if HecksDomainBuilder::Types.values.include?(@attribute.type)
          return value_assignment(skip_tabs: skip_tabs) if @attribute.type == 'Value'
          return reference_factory_assignment(skip_tabs: skip_tabs) if attribute.domain_module
          return factory_assignment(skip_tabs: skip_tabs)
        end

        private

        attr_reader :skip_tabs, :tab_count, :attribute

        def tabs
          ' ' * tab_count * 2
        end

        def reference_factory_assignment(skip_tabs: false)
          "#{tabs unless skip_tabs}@#{attribute.name} = #{attribute.type}Reference.factory(#{attribute.name})"
        end

        def factory_assignment(skip_tabs: false)
          return if attribute.read_only?
          "#{tabs unless skip_tabs}@#{attribute.name} = #{attribute.type}.factory(#{attribute.name})"
        end

        def value_assignment(skip_tabs: false)
          return if attribute.read_only?
          "#{tabs unless skip_tabs}@#{attribute.name} = #{attribute.name}"
        end
      end
    end
  end
end
