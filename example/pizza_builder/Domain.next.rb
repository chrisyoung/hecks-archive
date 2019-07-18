require 'pry'
require_relative 'lib/next_domain'

pp(
  next_domain('Pizzeria') do
    aggregate :pizzas do
      head :pizza do 
        string_value :name
        string_value :description
        entity(:named_by).as(:chef)
        list(:toppings).as(:topping)      
      end
      entity :chef { string_value(:name) }
      value_object :topping { string_value(:name) }
    end

    aggregate :orders do
      head :order do
        list(:line_items).as(:line_item)
      end
      value_object :line_item do
        string_value :pizza_name
        integer_value :quantity
        currency_value :price
        entity(:pizza).as(pizzas: :pizza)
      end
    end
  end
)