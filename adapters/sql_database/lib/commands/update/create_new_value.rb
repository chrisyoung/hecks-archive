module HecksAdapters
  class SQLDatabase
    module Commands
      class Update
        # Create any new values
        class CreateNewValue
          attr_reader :reference_ids

          def initialize(reference:, attributes:, reference_ids:)
            @reference = reference
            @attributes = attributes
            @reference_ids = {}
            @column = Column.factory(reference)
            @column_name = @column.name.to_sym
          end

          def call
            create_values
            create_value
            self
          end

          private

          def create_values
            return unless @reference.list?
            @attributes[@column_name].each do |value|
              @reference_ids[@column_name] ||= []
              id = SecureRandom.uuid
              DB[@column.to_table_name].insert(value.merge(id: id))
              @reference_ids[@column_name] << id
            end
          end

          def create_value
            return if @reference.list?
            id = SecureRandom.uuid
            DB[@column.to_table_name].insert(@attributes[@column.name.to_sym].merge(id: id))
            @reference_ids[@reference.name] = id
          end
        end
      end
    end
  end
end
