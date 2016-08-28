class CreatePizza < ActiveRecord::Migration
  def change
    create_table :pizzas do |t|
      t.string :name
      t.string :description
      t.string :toppings
    end
  end
end
