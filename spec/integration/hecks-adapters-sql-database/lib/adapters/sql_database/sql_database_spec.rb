describe Hecks::Adapters::SQLDatabase do
  let(:id) { app[:Pizzas].create(PIZZA_ATTRIBUTES).id }

  let(:new_attributes) do
    PIZZA_ATTRIBUTES.merge name: "ComeAgainPizza"
  end

  context "Working with Hecks Application" do
    let(:app) do
      HecksApplication.new(
        domain: PizzaBuilder,
        database: Hecks::Adapters::SQLDatabase
      )
    end

    describe '#create' do
      it { expect(app[:Pizzas].create(PIZZA_ATTRIBUTES).id).to_not be_nil }
    end

    describe "#read" do
      it '' do
        expect(app[:Pizzas].read(id).name).to eq('White Pizza')
      end
    end

    describe '#update' do
      it do
        app[:Pizzas].update(id, new_attributes)
        expect(app[:Pizzas].read(id).name).to eq('ComeAgainPizza')
      end
    end

    it '#delete' do
      app[:Pizzas].delete(id)
      expect(app[:Pizzas].read(id)).to be_nil
    end
  end
end
