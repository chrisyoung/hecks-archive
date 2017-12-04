{
  name: 'PizzaBuilder',
  domain: {
    'pizzas.pizza': {
      head: true,
      name: 'string',
      description: 'string',
      toppings: [{topping: {'name': String}}],
      named_by: [{chef: {'name': String}}]
    }
  }
}
