Sequel.migration do
  up do
    create_table(:orders_line_items) do
      primary_key :id
      Integer :order_id, :null=>false
      Integer :line_item_id, :null=>false
    end
  end

  down do
    drop_table(:orders_line_items)
  end
end
