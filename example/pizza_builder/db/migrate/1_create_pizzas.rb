Sequel.migration do
  up do
    create_table(:pizzas) do
      String :id, primary_key: true
      String :name, :null=>false
      String :description, :null=>false
      String :chef_id, :null=>false
    end
  end

  down do
    drop_table(:pizzas)
  end
end
