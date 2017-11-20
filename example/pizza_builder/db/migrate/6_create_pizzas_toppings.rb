Sequel.migration do
  up do
    create_table(:pizzas_toppings) do
      String :id, primary_key: true
      String :pizza_id, :null=>false
      String :topping_id, :null=>false
    end
  end

  down do
    drop_table(:pizzas_toppings)
  end
end
