require 'rack_test_helper'

describe "My Sinatra Application" do
  let(:pizza_attributes) do
    {
      name:        "White Pizza",
      description: 'yes',
      toppings:    ['garlic', 'chicken']
    }
  end

  before do
    post '/pizzas', pizza_attributes.to_json
  end

  it "create a pizza" do
    expect(last_response).to be_ok
    expect(JSON(last_response.body)['id']).to eq 1
  end

  it 'read a pizza' do
    get  '/pizzas/1'
    expect(JSON.parse(last_response.body)['name']).to eq "White Pizza"
  end

  it 'update a pizza' do
    put  '/pizzas/1', { attributes: { name: "new name" } }.to_json
    get  '/pizzas/1'
    expect(JSON.parse(last_response.body)['name']).to eq "new name"
  end

  it 'delete a pizza' do
    delete '/pizzas/1'
    get    '/pizzas/1'
    expect(JSON.parse(last_response.body)).to be_nil
  end
end
