describe Hecks::Adapters::ResourceServer::App do
  it 'reads aggregates' do
    read_pizza(2)
  end

  it 'creates aggregates' do
    create_pizza
  end

  it 'updates aggregates' do
    id = JSON.parse(create_pizza.body)["id"]
    put "/pizzas/#{id}", { name: "The Double Yuck" }.to_json
    expect(JSON.parse(read_pizza(id).body)["name"]).to eq "The Double Yuck"
  end

  it 'deletes aggregates' do
    id = JSON.parse(create_pizza.body)["id"]
    delete "/pizzas/#{id}"
    expect(JSON.parse(read_pizza(id).body)).to be_nil
  end

  def read_pizza(id)
    get "/pizzas/#{id}"
  end

  def create_pizza
    post '/pizzas', {
      name: "The Yuck",
      description: "Worse than it sounds",
      toppings: [{ name: 'children'}, {name: 'crickets'}]
    }.to_json
  end
end

# describe Hecks::Adapters::ResourceServer::App do
#   subject do
#     Hecks::Adapters::ResourceServer::App.new(domain: PizzaBuilder)
#   end
#
#   it 'Can post an entity' do
#     subject
#   end
# end

# # Build a resource server
#
# # Will instantiate an application on your behalf
# Hecks::Adapters::ResourceServer.new(
#   driving:      PizzaBuilder,
#   application:  Hecks::Adapters::Application,
#   database:     Hecks::Adapters::SQLDatabase
# )
# # Or this (pre-instantiated application):
# Hecks::Adapters::ResourceServer.new(application: application)
