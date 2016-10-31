module Hecks
  module Adapters
    class SQLDatabase
      DB = Sequel.connect(
        adapter:  'mysql2',
        user:     'root',
        host:     'localhost',
        database: 'pizza_builder',
        password: "password"
      )

      DB.create_table? :pizzas do
        primary_key :id
        String :name
        String :description
      end

      DB.create_table? :pizza_toppings do
        Integer :pizza_id
        String :name
      end

      DB.create_table? :toppings do
        String :name
      end
    end
  end
end
