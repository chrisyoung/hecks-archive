Sequel.migration do
  up do
    create_table(:orders) do
      primary_key :id
      LineItem :line_items, :null=>false
    end
  end

  down do
    drop_table(:orders)
  end
end
