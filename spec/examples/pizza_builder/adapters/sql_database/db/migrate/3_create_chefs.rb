Sequel.migration do
  up do
    create_table(:chefs) do
      primary_key :id
      String :name, :null=>false
    end
  end

  down do
    drop_table(:chefs)
  end
end
