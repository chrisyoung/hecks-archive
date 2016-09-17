require 'rack_test_helper'

describe "My Sinatra Application" do
  let(:attributes) do
    {
      name:        "White Pizza",
      children:    ['garlic', 'chicken']
    }
  end

  before do
    post '/test', attributes.to_json
  end

  it "creates" do
    expect(last_response).to be_ok
    expect(JSON(last_response.body)['id']).to eq 1
  end

  it 'read a pizza' do
    get  '/test/1'
    expect(JSON.parse(last_response.body)['name']).to eq "White Pizza"
  end

  it 'update a pizza' do
    put  '/test/1', { attributes: { name: "new name" } }.to_json
    get  '/test/1'
    expect(JSON.parse(last_response.body)['name']).to eq "new name"
  end

  it 'delete a pizza' do
    delete '/test/1'
    get    '/test/1'
    expect(JSON.parse(last_response.body)).to be_nil
  end
end
