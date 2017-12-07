describe HecksDomain::CLI::GenerateDomainObject::SetterTemplate do
  it 'assigns entities' do
    expect(described_class.new(["thing:Thing"]).render).to eq "def thing=(thing)\n  @thing = Thing.factory(thing)\nend\n"
  end

  it 'assigns primitives' do
    expect(described_class.new(["name:String"]).render).to eq "def name=(name)\n  @name = name\nend\n"
  end
end
