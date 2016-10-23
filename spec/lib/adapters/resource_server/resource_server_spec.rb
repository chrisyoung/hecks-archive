describe Hecks::Adapters::ResourceServer::App do
  let(:id) { JSON.parse(last_response.body)['id'] }

  it 'reads a resource' do
    post '/pizzas', attributes.to_json
    get "/pizzas/#{id}"
    name = JSON.parse(last_response.body)['name']
    expect(name).to eq 'The Yuck'
  end

  it 'creates a resource' do
    post '/pizzas', attributes.to_json
    expect(JSON.parse(last_response.body)["id"]).to be
  end

  it 'updates a resource' do
    post '/pizzas', attributes.to_json
    put "/pizzas/#{id}", attributes.merge(name: "The Double Yuck").to_json
    get "/pizzas/#{id}"
    expect(JSON.parse(last_response.body)["name"]).to eq "The Double Yuck"
  end

  it 'deletes a resource' do
    post '/pizzas', attributes.to_json
    delete "/pizzas/#{id}"
    get "/pizzas/#{id}"
    expect(JSON.parse(last_response.body)).to be_nil
  end

  private

  def attributes
    {
      name: 'The Yuck',
      description: "Worse than it sounds",
      toppings: [{ name: 'children'}, { name: 'crickets' }]
    }
  end
end
