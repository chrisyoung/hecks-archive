class HecksApplication
  module Commands
    describe Delete do
      let(:pizza_id) do
        Create.new(
          args:          PIZZA_ATTRIBUTES,
          domain_module: domain_module,
          repository:    repository
        ).call.result[:id]
      end

      subject do
        described_class.new(
          args:          { id: pizza_id },
          domain_module: domain_module,
          repository:    repository
        )
      end

      let(:repository)       { PizzaBuilder.repositories[:pizzas] }
      let(:domain_module)    { DOMAIN.domain_modules[:Pizzas] }
      let(:pizza_attributes) { PIZZA_ATTRIBUTES.clone }

      describe '#call' do
        it 'deletes' do
          expect(find_by_id).to_not be_nil
          subject.call
          expect(find_by_id).to be_nil
        end
      end

      def find_by_id
        HecksApplication::Queries::FindById.new(
          repository: repository
        ).call(id: pizza_id)
      end
    end
  end
end
