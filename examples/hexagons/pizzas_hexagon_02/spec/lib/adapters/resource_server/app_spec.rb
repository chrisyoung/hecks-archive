require 'rack_test_helper'

describe "My Sinatra Application" do
  let(:attributes) do
    {
      name:        "White Pizza",
      description: 'yes',
      toppings:    ['garlic', 'chicken']
    }
  end

  before do
    post '/pizzas', attributes.to_json
  end

  xit "create a pizza" do
    expect(last_response).to be_ok
    expect(JSON(last_response.body)['id']).to eq 1
  end

  xit 'read a pizza' do
    get  '/pizzas/1'
    expect(JSON.parse(last_response.body)['name']).to eq "White Pizza"
  end

  xit 'update a pizza' do
    put  '/pizzas/1', { attributes: { name: "new name" } }.to_json
    get  '/pizzas/1'
    expect(JSON.parse(last_response.body)['name']).to eq "new name"
  end

  xit 'delete a pizza' do
    delete '/pizzas/1'
    get    '/pizzas/1'
    expect(JSON.parse(last_response.body)).to be_nil
  end
end
