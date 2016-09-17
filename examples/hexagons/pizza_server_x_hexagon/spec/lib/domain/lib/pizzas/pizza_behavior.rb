# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Pizza" do
  describe 'attributes' do
    subject do
      described_class.new(name: name, description: description, toppings: toppings, id: id)
    end
  end
end
