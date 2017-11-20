Sequel.migration do
  up do
    create_table(:chefs) do
      String :id, primary_key: true
      String :name, :null=>false
    end
  end

  down do
    drop_table(:chefs)
  end
end
