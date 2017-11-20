describe HecksAdapters::SQLDatabase do
  let(:new_attributes) do
    PIZZA_ATTRIBUTES.merge name: "ComeAgainPizza"
  end

  context "Working with Hecks Application" do
    let(:app) do
      HecksApplication.new(
        domain: PizzaBuilder,
        database: HecksAdapters::SQLDatabase
      )
    end

    describe '#create' do
      it { expect(app[:Pizzas].create(PIZZA_ATTRIBUTES).result[:id]).to_not be_nil }
    end

    describe "#read" do
      it '' do
        id = app[:Pizzas].create(PIZZA_ATTRIBUTES).result[:id]
        expect(app[:Pizzas].read(id).name).to eq('White Pizza')
      end
    end

    describe '#update' do
      it do
        id = app[:Pizzas].create(PIZZA_ATTRIBUTES).result[:id]
        app[:Pizzas].update(new_attributes)
        expect(app[:Pizzas].read(id).name).to eq('ComeAgainPizza')
      end
    end

    it '#delete' do
      id = app[:Pizzas].create(PIZZA_ATTRIBUTES).result[:id]
      app[:Pizzas].delete(id)
      expect(app[:Pizzas].read(id)).to be_nil
    end
  end
end
