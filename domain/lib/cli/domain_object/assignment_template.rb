require_relative 'assigner'
require_relative 'hash_assigner'

module HecksDomain
  module CLI
    # Helpful methods for supporting object creation
    class GenerateDomainObject
      class AssignmentTemplate
        def initialize(attributes, tab_count: 5, assign_from_hash: false)
          @attributes = attributes
          @tab_count = tab_count
          @assign_from_hash = assign_from_hash
        end

        def render
          attributes.map.with_index do |attribute, i|
            @attribute = HecksDomainBuilder::Attribute.new(attribute)
            if assign_from_hash
              do_assignment(skip_tabs: i==0, assigner: HashAssigner)
            else
              do_assignment(skip_tabs: i==0, assigner: Assigner)
            end
          end.join("\n")
        end

        private

        attr_reader :attributes, :attribute, :tab_count, :assign_from_hash

        def do_assignment(skip_tabs: false, assigner:)
          assigner.new(
            attribute: attribute,
            skip_tabs: skip_tabs,
            tab_count: tab_count
          ).render
        end
      end
    end
  end
end
