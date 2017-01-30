describe Hecks::DomainBuilder::Reference do
  subject {described_class.new(name: "pizzas::pizza")}
  it '#module' do
    expect(subject.module).to eq "pizzas"
  end

  it '#object' do
    expect(subject.object).to eq "pizza"
  end
end
