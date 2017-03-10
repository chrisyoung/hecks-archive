module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class Update
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
                  @reference_ids[@column_name] << DB[@column.to_table_name].insert(value)
                end
              end

              def create_value
                return if @reference.list?
                @reference_ids[@reference.name] = DB[@column.to_table_name].insert(@attributes[@column.name.to_sym])
              end
            end
          end
        end
      end
    end
  end
end
