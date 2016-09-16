require_relative 'topping_behavior.rb'

module PizzasHexagon
  module Domain
    describe Pizzas::Topping do
      subject { described_class.new }

      
        let(:name) { double('Name') }
      

      it_should_behave_like("a Domain Topping")
    end
  end
end
