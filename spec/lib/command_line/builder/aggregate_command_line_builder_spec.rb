describe Hecks::Builder::AggregateCommandLineBuilder do
  let(:domain) do
    eval(File.read('spec/examples/pizza_builder/HECKS')).domain
  end

  let(:runner) do
    instance_double(CommandRunner)
  end

  let(:pizzas_domain_module) do
    ["generate:domain_object", "-t", "aggregate", "-n", "Pizzas", "--head_name", "Pizza", "-a", ["name:Value", "description:Value", "toppings:Topping"]]
  end

  let(:orders_domain_module) do
    ["generate:domain_object", "-t", "aggregate", "-n", "Orders", "--head_name", "Order", "-a", ["line_items:LineItem"]]
  end

  it 'calls the command line runner to generate the module references' do
    expect(runner).to receive(:call).with(pizzas_domain_module)
    expect(runner).to receive(:call).with(orders_domain_module)
    described_class.build(domain, runner)
  end
end
