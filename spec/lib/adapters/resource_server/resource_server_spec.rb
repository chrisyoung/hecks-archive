describe Hecks::Adapters::ResourceServer::App do
  let(:id) {JSON.parse(create_pizza.body)["id"]}

  it 'reads aggregates' do
    create_pizza
    expect(JSON.parse(read_pizza(id).body)['name']).to eq 'The Yuck'
  end

  it 'creates aggregates' do
    expect(JSON.parse(create_pizza.body)["id"]).to be
  end

  it 'updates aggregates' do
    put "/pizzas/#{id}", attributes('The Double Yuck').to_json
    expect(JSON.parse(read_pizza(id).body)["name"]).to eq "The Double Yuck"
  end

  it 'deletes aggregates' do
    delete "/pizzas/#{id}"
    expect(JSON.parse(read_pizza(id).body)).to be_nil
  end

  private

  def read_pizza(id)
    get "/pizzas/#{id}"
  end

  def create_pizza(name="The Yuck")
    attributes.merge(name: name)
    post '/pizzas', attributes.to_json
  end

  def attributes(name="The Yuck")
    {
      name: name,
      description: "Worse than it sounds",
      toppings: [{ name: 'children'}, {name: 'crickets'}]
    }
  end
end
