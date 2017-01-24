describe Hecks::DomainBuilder do
  it do
    builder = eval(File.read('spec/pizza_builder_domain_builder.rb'))
    expect(builder.domain.name).to eq "pizza_builder"
  end
end
