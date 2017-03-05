describe Hecks::Builder::ReferenceCommandLineBuilder do
  let(:runner) do
    instance_double(CommandRunner)
  end

  let(:result) do
    ["generate domain_object", "-t", "reference", "-n", "PizzaReference", "-m", "Orders", "-r", "Pizzas::Pizza"]
  end

  it 'calls the command line runner to generate the module references' do
    expect(runner).to receive(:call).with(result)
    described_class.build(DOMAIN, runner)
  end
end
