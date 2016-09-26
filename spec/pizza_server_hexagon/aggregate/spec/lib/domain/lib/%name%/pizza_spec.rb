require_relative 'pizza_behavior.rb'

module PizzaServerHexagon
  module Domain
    describe Pizzas::Pizza do
      subject { described_class.new }

      let(:name) { double('Name') }
      let(:description) { double('Description') }
      let(:toppings) { double('Toppings') }
      let(:id) { double('Id') }

      it_should_behave_like("a Domain Pizza")
    end
  end
end
