require_relative 'topping_behavior.rb'

module PizzaServerHexagon
  module Domain
    describe ModuleName::module_name do
      subject { described_class.new }

      
        let(:name) { double('Name') }
      
        let(:id) { double('Id') }
      

      it_should_behave_like("a Domain module_name")
    end
  end
end
