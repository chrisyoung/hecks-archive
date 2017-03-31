describe Hecks::Adapters::SQLDatabase do
  let(:pizza_attributes) do
    {
      name: 'White Pizza',
      chef: { name: "Belleboche" },
      description: 'white sauce and chicken',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:id) { app[:Pizzas].create(pizza_attributes).id }

  let(:new_attributes) do
    pizza_attributes.merge name: "ComeAgainPizza"
  end

  context "Working with Hecks Application" do
    let(:app) do
      Hecks::Application.new(
        domain: PizzaBuilder,
        database: Hecks::Adapters::SQLDatabase
      )
    end

    describe '#create' do
      xit { expect(app[:Pizzas].create(pizza_attributes).id).to_not be_nil }
    end

    describe "#read" do
      xit '' do
        expect(app[:Pizzas].read(id).name).to eq('White Pizza')
      end
    end

    describe '#update' do
      xit do
        app[:Pizzas].update(id, new_attributes)
        expect(app[:Pizzas].read(id).name).to eq('ComeAgainPizza')
      end
    end

    xit '#delete' do
      app[:Pizzas].delete(id)
      expect(app[:Pizzas].read(id)).to be_nil
    end
  end
end
