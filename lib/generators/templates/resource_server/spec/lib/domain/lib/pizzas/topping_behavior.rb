# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Topping" do
  describe 'attributes' do
    subject do
      described_class.new(name: name)
    end
  end
end
