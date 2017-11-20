Sequel.migration do
  up do
    create_table(:orders) do
      String :id, primary_key: true
    end
  end

  down do
    drop_table(:orders)
  end
end
