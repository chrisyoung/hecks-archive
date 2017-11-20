Sequel.migration do
  up do
    create_table(:line_items) do
      String :id, primary_key: true
      String :pizza_name, :null=>false
      Integer :quantity, :null=>false
      BigDecimal :price, :null=>false
      String :pizza_id, :null=>false
    end
  end

  down do
    drop_table(:line_items)
  end
end
