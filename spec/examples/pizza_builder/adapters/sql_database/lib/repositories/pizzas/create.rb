module PizzaBuilder
  module Domain
    module Pizzas
      class SQLRepository
        class Create
          attr_reader :id

          def initialize(attributes:, domain_module:)
            @attributes = attributes
            @reference_ids = {}
            @head = domain_module.head
          end

          def call
            DB.transaction do
              @head.references.each do |reference|
                find_or_create_reference(reference, @attributes.delete(reference.name.to_sym)) unless reference.list?
                find_or_create_references(reference, @attributes.delete(reference.name.to_sym)) if reference.list?
              end

              create

              @head.references.each do |reference|
                add_to_join_tables(reference) if reference.list?
              end
            end
            self
          end

          private

          def find_or_create_reference(reference, attributes)
            result = DB[reference.type.downcase.pluralize.to_sym].first(attributes)
            @reference_ids[reference.name] = result ? result[:id] : DB[reference.type.downcase.pluralize].insert(attributes)
          end

          def create
            references = @head.references.reject(&:list?)
            graph = references.map {|reference| [reference.name + '_id', @reference_ids[reference.name]]}.to_h
            @id = DB[@head.name.pluralize.downcase.to_sym].insert(@attributes.merge(graph))
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

          def add_to_join_tables(reference)
            @reference_ids[reference.name.downcase].each do |id|
              table_name = "#{@head.name.pluralize.downcase}_#{reference.type.downcase.pluralize}"

              DB[table_name.to_sym].insert(
                [ ["#{@head.name}_id".to_sym, @id],
                  [(reference.type.downcase + '_id').to_sym, id]
                ].to_h
              )
            end
          end
        end
      end
    end
  end
end
