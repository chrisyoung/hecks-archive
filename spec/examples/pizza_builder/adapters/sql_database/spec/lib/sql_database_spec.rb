describe PizzaBuilder::Adapters::SQLDatabase do

  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      chef: {name: "Belleboche"},
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:new_attributes) do
    pizza_attributes.merge name: "ComeAgainPizza"
  end

  context "Working with Hecks Application" do
    describe '#create' do
      let(:app) do
        Hecks::Application.new(
          domain: PizzaBuilder,
          database: PizzaBuilder::Adapters::SQLDatabase
        )
      end

      it '#read' do
        id = app[:Pizzas].create(pizza_attributes).id
        expect(app[:Pizzas].read(id).name).to eq(pizza_attributes[:name])
      end

      it '#update' do
        id = app[:Pizzas].create(pizza_attributes).id
        app[:Pizzas].update(id, new_attributes)
        expect(app[:Pizzas].read(id).name).to eq(new_attributes[:name])
      end

      it '#delete' do
        id = app[:Pizzas].create(pizza_attributes).id
        app[:Pizzas].delete(id)
        expect(app[:Pizzas].read(id)).to be_nil
      end
    end
  end
end
