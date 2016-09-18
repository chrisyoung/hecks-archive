# this represents the behavior of objects that want to prented to be domain objects
RSpec.shared_examples "a Domain Entity" do
  describe 'attributes' do
    subject do
      described_class.new(name: name, children: children, id: id)
    end
  end
end
