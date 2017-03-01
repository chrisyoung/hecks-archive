Sequel.migration do
  up do
    create_table(:line_items) do
      primary_key :id
      String :pizza_name, :null=>false
      Integer :quantity, :null=>false
      BigDecimal :price, :null=>false
    end
  end

  down do
    drop_table(:line_items)
  end
end
