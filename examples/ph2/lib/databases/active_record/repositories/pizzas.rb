module Databases
  class ActiveRecord
    module Domain
      module Pizzas
        class Repository < ::ActiveRecord::Base
          self.table_name = "pizzas"
        end
      end
    end
  end
end
