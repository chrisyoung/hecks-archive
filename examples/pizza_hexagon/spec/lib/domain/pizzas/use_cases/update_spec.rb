class PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        describe Update do
          let(:validator)  { double('Validator',  call: nil, errors: []) }
          let(:repository) { double('Repository', update: nil) }
          let(:database_adapter) { double('Adapter', :[] => repository) }
          let(:attributes) { { name: "new name" } }

          subject do
            described_class.new(
              args: {id: 1, attributes: attributes},
              database_adapter: database_adapter,
              validators: [validator]
            )
          end

          it 'updates a pizza' do
            expect(repository).to receive(:update).with(id: 1, attributes: attributes)
            subject.call()
          end

          it 'aggregates errors from the validators' do
            expect(subject.call().errors).to eq []
          end
        end
      end
    end
  end
end
