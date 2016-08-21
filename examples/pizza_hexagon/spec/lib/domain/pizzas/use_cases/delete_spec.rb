class PizzaHexagon
  module Domain
    module Pizzas
      module UseCases
        describe Delete do
          let(:validator)  { double('Validator',  call: nil, errors: []) }
          let(:repository) { double('Repository', delete: nil) }
          let(:database_adapter) { double('Adapter', :[] => repository) }

          subject do
            described_class.new(
              args: {id: 1},
              database_adapter: database_adapter,
              validators: [validator]
            )
          end

          it 'deletes a pizza' do
            expect(repository).to receive(:delete).with(id: 1)
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
