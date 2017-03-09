module Hecks
  module Domain
    module Adapters
      module SQLDatabase
        module Commands
          class CreateNewValue
            attr_reader :reference_ids

            def initialize(reference:, attributes:, reference_ids:)
              @reference = reference
              @attributes = attributes
              @reference_ids = {}
              @column = Column.factory(reference)
            end

            def call
              if @reference.list?
                @attributes[@column.name.to_sym].each do |value|
                  @reference_ids[@column.name.to_sym] ||= []
                  @reference_ids[@column.name.to_sym] << DB[@column.to_table_name].insert(value)
                end
              else
                @reference_ids[@reference.name] = DB[@column.to_table_name].insert(@attributes[@column.name.to_sym])
              end
              self
            end
          end
        end
      end
    end
  end
end
