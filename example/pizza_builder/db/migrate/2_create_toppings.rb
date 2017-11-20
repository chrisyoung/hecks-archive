Sequel.migration do
  up do
    create_table(:toppings) do
      String :id, primary_key: true
      String :name, :null=>false
    end
  end

  down do
    drop_table(:toppings)
  end
end
