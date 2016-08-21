class PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        describe Create do
          let(:repository) { double('Repository', create: 1) }
          let(:database_adapter) { double('Adapter', :[] => repository) }

          subject do
            described_class.new(
              args: { name: "Chris", toppings: ['Pepperoni'] },
              database_adapter: database_adapter,
              validators: [validator]
            )
          end

          it 'creates a pizza' do
            expect(repository).to receive(:create)
            subject.call()
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
end
