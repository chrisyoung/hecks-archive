require_relative 'entity_behavior.rb'

module PizzaServerXHexagon
  module Domain
    describe Test::Entity do
      subject { described_class.new }

      
        let(:name) { double('Name') }
      
        let(:id) { double('Id') }
      

      it_should_behave_like("a Domain Entity")
    end
  end
end
