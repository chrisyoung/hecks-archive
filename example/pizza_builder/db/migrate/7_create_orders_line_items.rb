Sequel.migration do
  up do
    create_table(:orders_line_items) do
      String :id, primary_key: true
      String :order_id, :null=>false
      String :line_item_id, :null=>false
    end
  end

  down do
    drop_table(:orders_line_items)
  end
end
