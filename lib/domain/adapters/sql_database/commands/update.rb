module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class Update
            attr_reader :id
            def initialize(attributes:, domain_module:)
              @original_attributes = attributes
              @attributes = attributes.clone
              @head = domain_module.head
              @reference_ids = {}
            end

            def call
              DB.transaction do
                @head.references.each do |reference|
                  create_new_value(reference)
                  delete_old_references(reference)
                  link_to_new_values(reference)
                end

                DB[@head.name.pluralize.downcase.to_sym].where(id: @attributes.delete(:id)).update(@attributes)

                self
              end
            end

            private

            def link_to_new_values(reference)
              record = {}
              if reference.list?
                @reference_ids[reference.name].each do |value|
                  record[(reference.type.downcase + '_id').to_sym] = value
                  record[(@head.name.downcase + '_id').to_sym] = @attributes[:id]
                  DB[("#{@head.name.pluralize.downcase}_#{reference.type.pluralize.downcase}").to_sym].insert(record)
                end
              else
                @attributes[(reference.type.downcase + '_id').to_sym] = @reference_ids[reference.name]
              end
            end

            def delete_old_references(reference)
              where = {}
              where["#{@head.name.downcase}_id".to_sym] = @attributes[:id]
              if reference.list?
                DB[("#{@head.name.pluralize.downcase}_#{reference.name.pluralize.downcase}").to_sym].where(where).delete
              end
              @attributes.delete(reference.name.to_sym)
            end

            def create_new_value(reference)
              if reference.list?
                @attributes[reference.name.to_sym].each do |value|
                  @reference_ids[reference.name] ||= []
                  @reference_ids[reference.name] << DB[reference.type.downcase.pluralize.to_sym].insert(value)
                end
              else
                @reference_ids[reference.name] = DB[reference.type.downcase.pluralize.to_sym].insert(@attributes[reference.name.to_sym])
              end
            end

            def create_new_toppings
              @toppings.each do |topping|
                topping_id = DB[:toppings].insert(name: topping[:name])
                DB[:pizzas_toppings].insert(pizza_id: @pizza_id, topping_id: topping_id)
              end
            end
          end
        end
      end
    end
  end
end
