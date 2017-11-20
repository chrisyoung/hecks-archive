# New builder format:

Pizzas::Pizza(
  name:        String,
  description: String,
  toppings:    [Topping(name: String)],
  named_by:    Chef(name: String)
)

Orders::Order(
  line_items: [
    LineItems(
      pizza_name: String,
      quantity:   String,
      price:      String,
      pizzas:     Pizzas::Pizza
    )
  ]
)

# NOTE: Domain should generate english sentences
# A pizza has many toppings, and a has a description
# A pizza is named by a chef
# An Order has many line items
# A Line Item has a a pizza, pizza_name, a quantity and a price
