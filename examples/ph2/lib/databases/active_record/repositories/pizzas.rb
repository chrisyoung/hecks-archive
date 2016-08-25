module Databases
  module ActiveRecord
    module Repositories
      class Pizzas < ::ActiveRecord::Base
        self.table_name = "pizzas"
      end
    end
  end
end
