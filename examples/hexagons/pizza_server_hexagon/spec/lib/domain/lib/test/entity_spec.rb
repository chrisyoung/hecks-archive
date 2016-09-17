require_relative 'entity_behavior.rb'

module PizzaServerHexagon
  module Domain
    describe Test::Entity do
      subject { described_class.new }

      
        let(:name) { double('Name') }
      
        let(:children) { double('Children') }
      
        let(:id) { double('Id') }
      

      it_should_behave_like("a Domain Entity")
    end
  end
end
