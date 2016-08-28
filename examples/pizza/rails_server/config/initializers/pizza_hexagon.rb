class PizzasCreateListener
  def pizzas_create(command)
    Topping.upsert(command.args[:toppings])
  end
end

Hexagon = PizzaHexagon::App.new(listeners: [PizzasCreateListener.new])
