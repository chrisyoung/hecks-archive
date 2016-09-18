require_relative '../../lib/parser'

hexagon = {
  name: "pizza_server",
  modules: [
    {
      name: "pizzas",
      objects: [
        {
          name: "pizza",
          attributes: {
            name:        :string,
            description: :string,
            toppings:    [:topping]
          },
          head: true
        },
        {
          name: "topping",
          attributes: {
            name: :string
          }
        }
      ],
      services: [:crud_commands]
    },
  ],
  services: [:resource_server]
}

Hecks::Parser.new(hexagon).call
