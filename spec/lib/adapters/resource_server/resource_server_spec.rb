describe Hecks::Adapters::ResourceServer do
  let(:last_id)   { JSON.parse(last_response.body)['id'] }
  let(:last_json) { JSON.parse(last_response.body) }

  it 'reads a resource' do
    post  '/pizzas', attributes.to_json
    get   "/pizzas/#{last_id}"
    name = last_json['name']
    expect(name).to eq 'The Yuck'
  end

  it 'creates a resource' do
    post '/pizzas', attributes.to_json
    expect(last_json["id"]).to be
  end

  it 'updates a resource' do
    post  '/pizzas', attributes.to_json
    put   "/pizzas/#{last_id}", attributes.merge(name: "The Double Yuck").to_json
    get   "/pizzas/#{last_id}"
    expect(last_json["name"]).to eq "The Double Yuck"
  end

  it 'deletes a resource' do
    post   '/pizzas', attributes.to_json
    delete "/pizzas/#{last_id}"
    get    "/pizzas/#{last_id}"
    expect(last_json).to be_nil
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
