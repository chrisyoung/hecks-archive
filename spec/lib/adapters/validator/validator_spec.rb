describe Hecks::Adapters::Validator do
  let(:args) do
    {
      name: 'White Pizza',
      toppings: [{ name: 'chicken' }]
    }
  end

  let(:head_spec) {
    head = Hecks::DomainBuilder::Head.new(name: 'Pizza')
    head.attributes('name:value', 'description:value', 'toppings:[Topping]')
    head
  }

  subject { described_class.new(args: args, head_spec: head_spec) }

  it 'lists errors' do
    expect(subject.call.errors).to eq description: ['missing']
  end
end
