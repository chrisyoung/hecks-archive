Sequel.migration do
  up do
    create_table(:pizzas_toppings) do
      primary_key :id
      Integer :pizza_id, :null=>false
      Integer :topping_id, :null=>false
    end
  end

  down do
    drop_table(:pizzas_toppings)
  end
end
