require_relative 'topping_behavior.rb'

module PizzaServerHexagon
  module Domain
    describe Pizzas::pizzas do
      subject { described_class.new }

      
        let(:name) { double('Name') }
      
        let(:id) { double('Id') }
      

      it_should_behave_like("a Domain pizzas")
    end
  end
end
