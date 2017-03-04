Sequel.migration do
  up do
    create_table(:toppings) do
      primary_key :id
      String :name, :null=>false
    end
  end

  down do
    drop_table(:toppings)
  end
end
