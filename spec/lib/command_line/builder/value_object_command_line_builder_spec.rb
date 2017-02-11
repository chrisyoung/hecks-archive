describe Hecks::Builder::ValueObjectCommandLineBuilder do
  let(:domain) do
    eval(File.read('spec/examples/pizza_builder/HECKS')).domain
  end

  let(:runner) do
    instance_double(CommandRunner)
  end

  let(:line_item_command) do
    ["generate:domain_object", "-t", "value_object", "-n", "LineItem", "-m", "Orders", "-a", ["pizza_name:Value", "quantity:Value", "price:Value", "pizza:Pizza"]]
  end
  let(:topping_command) do
    ["generate:domain_object", "-t", "value_object", "-n", "Topping", "-m", "Pizzas", "-a", ["name:Value"]]
  end

  it 'calls the command line runner to generate the module references' do
    expect(runner).to receive(:call).with(line_item_command)
    expect(runner).to receive(:call).with(topping_command)
    described_class.build(domain, runner)
  end
end