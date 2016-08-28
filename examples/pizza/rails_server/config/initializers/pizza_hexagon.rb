class PizzasCreateListener
  def pizzas_create(command)
    Topping.save_toppings(command.args[:toppings])
  end
end

Hexagon = PizzaHexagon::App.new(listeners: [PizzasCreateListener.new])
