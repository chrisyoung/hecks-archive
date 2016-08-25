class Ph2
  module Domain
    module Pizzas
      describe UseCases::Create do
        it 'creates a pizza' do
          UseCases::Create.new(
            args: { name: "White Pizza", toppings: ['garlic', 'chicken'] }
          ).call

          expect(Queries::Read.new.run(id: 1).name).to == "White Pizza"
        end

        it 'attaches an id' do
          expect(subject.call.id).to eq 1
        end

        it 'aggregates errors from the validators' do
          expect(subject.call().errors).to eq []
        end
      end
    end
  end
end
