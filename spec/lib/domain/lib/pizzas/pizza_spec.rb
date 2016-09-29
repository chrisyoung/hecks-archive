require_relative 'pizza_behavior.rb'

module PizzaServerHexagon
  module Domain
    describe ::Pizza do
      subject { described_class.new }

      let(:["name", "string"]) { double('["name", "string"]') }
      let(:["description", "string"]) { double('["description", "string"]') }
      let(:["toppings", "[topping]"]) { double('["toppings", "[topping]"]') }
      let(:[:id, "integer"]) { double('[:id, "integer"]') }

      it_should_behave_like("a Domain Pizza")
    end
  end
end
