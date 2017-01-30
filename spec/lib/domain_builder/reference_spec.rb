describe Hecks::DomainBuilder::Reference do
  subject {described_class.new("pizzas::pizza")}

  it '#name' do
    expect(subject.name).to eq "PizzaReference"
  end

  it '#referenced_entity' do
    expect(subject.referenced_entity).to eq "Pizzas::Pizza"
  end
end
