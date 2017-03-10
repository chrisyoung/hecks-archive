module Hecks
  module Adapters
    module SQLDatabase
      module Commands
        class Create
          class FindOrCreateReferences
            attr_reader :reference_ids

            def initialize(head:, attributes:)
              @head = head
              @attributes = attributes
              @reference_ids = {}
            end

            def call
              @head.references.each do |reference|
                find_or_create_reference(reference, @attributes.delete(reference.name.to_sym)) unless reference.list?
                find_or_create_references(reference, @attributes.delete(reference.name.to_sym)) if reference.list?
              end
              self
            end

            private

            def find_or_create_reference(reference, attributes)
              result = DB[reference.type.downcase.pluralize.to_sym].first(attributes)
              @reference_ids[reference.name] = result ? result[:id] : DB[reference.type.downcase.pluralize].insert(attributes)
            end

            def find_or_create_references(reference, attribute_list)
              attribute_list.each do |attributes|
                @reference_ids[reference.name] = [] unless @reference_ids[reference.name]

                result = DB[reference.type.downcase.pluralize.to_sym].first(attributes)

                @reference_ids[reference.name] <<
                if result
                  result[:id]
                else
                  DB[reference.type.downcase.pluralize.to_sym].insert(attributes)
                end
              end
            end
          end
        end
      end
    end
  end
end
