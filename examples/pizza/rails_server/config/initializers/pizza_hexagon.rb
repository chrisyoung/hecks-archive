class PizzasCreateListener
  def pizzas_create(command)
    command.args[:toppings].each do |topping|
      Topping.new(name: topping["name"]).save
    end
  end
end

Hexagon = PizzaHexagon::App.new(listeners: [PizzasCreateListener.new])
