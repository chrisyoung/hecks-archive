module PizzaHexagon::Domain::Pizzas
  class Query
    def initialize(database: PizzaHexagon::Databases::Memory)
      @database = database
    end

    def call(params)
      if params.keys == [:id]
        @database[:pizzas].read(params[:id])
      end
    end
  end
end
