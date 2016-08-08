require_relative 'pizza_behavior.rb'

module PizzaHexagon::Domain
  describe Pizzas::Pizza do
    subject { described_class.new }

    let(:name) { double('Name') }

    it_should_behave_like("a Domain Pizza")
  end
end
