require_relative 'pizza_behavior.rb'

module PizzasHexagon
  module Domain
    describe Pizzas::Pizza do
      subject { described_class.new }

      let(:name) { double('Name') }
  	  let(:description) { double('Description') }
  	  let(:topping) { double('Topping') }
  	  let(:toppings) { [topping] }

      it_should_behave_like("a Domain Pizza")
    end
  end
end
