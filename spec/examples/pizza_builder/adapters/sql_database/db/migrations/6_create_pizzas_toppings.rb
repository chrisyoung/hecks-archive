Sequel.migration do
  up do
    create_table(:pizzas_toppings) do
      primary_key :id
      Integer :pizzas_id, :null=>false
      Integer :toppings_id, :null=>false
    end
  end

  down do
    drop_table(:pizzas_toppings)
  end
end
