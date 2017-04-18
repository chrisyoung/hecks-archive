describe Hecks::Adapters::DynamoDB do
  let(:id) { app[:Pizzas].create(PIZZA_ATTRIBUTES).id }

  let(:new_attributes) do
    PIZZA_ATTRIBUTES.merge name: "ComeAgainPizza"
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
        result = app[:pizzas].create(PIZZA_ATTRIBUTES)
        expect(result.id).to_not be_nil
      end
    end

    describe "#read" do
      it '' do
        r = app[:Pizzas].read({id: id})
        expect(r.name).to eq('White Pizza')
      end
    end

    describe '#update' do
      it do
        app[:Pizzas].update(id, new_attributes)
        result = app[:Pizzas].read(id: id)
        expect(result.name).to eq('ComeAgainPizza')
      end
    end

    it '#delete' do
      app[:Pizzas].delete(id: id)
      expect(app[:Pizzas].read(id: id)).to be_nil
    end
  end
end
