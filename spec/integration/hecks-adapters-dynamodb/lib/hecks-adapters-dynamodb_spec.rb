describe Hecks::Adapters::DynamoDB do
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
        database: Hecks::Adapters::DynamoDB
      )
    end

    describe '#create' do
      it do
        result = app[:pizzas].create(pizza_attributes)
        expect(result.id).to_not be_nil
      end
    end

    describe "#read" do
      it '' do
        r = app[:Pizzas].read(id)
        expect(r.name).to eq('White Pizza')
      end
    end

    describe '#update' do
      it do
        app[:Pizzas].update(id, new_attributes)
        result = app[:Pizzas].read(id)
        expect(result.name).to eq('ComeAgainPizza')
      end
    end

    it '#delete' do
      app[:Pizzas].delete(id)
      expect(app[:Pizzas].read(id)).to be_nil
    end
  end
end
