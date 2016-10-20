describe Hecks::Adapters::ResourceServer::App do
  it 'reads aggregates' do
    get '/pizzas/2'
  end

  it 'creates aggregates' do
    post '/pizzas', {
      name: "The Yuck",
      description: "Worse than it sounds",
      toppings: [{ name: 'children'}, {name: 'crickets'}]
    }.to_json
  end

  it 'updates aggregates'
  it 'deletes aggregates'
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
