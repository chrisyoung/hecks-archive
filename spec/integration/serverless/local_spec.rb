describe 'Serverless Tests' do
  def run(command)
    command = "cd example/pizza_builder && serverless invoke local -f pizzas_#{command}"
    result = `#{command}`
    JSON.parse(result, symbolize_names: true) unless result.include? "null"
  end

  let(:pizza_attributes)   { PIZZA_ATTRIBUTES }
  let(:updated_attributes) { PIZZA_ATTRIBUTES.merge(name: "Green Pizza") }

  describe '#create' do
    it 'returns an id' do
      expect(create_body[:result][:id]).to_not be_nil
    end
  end

  describe '#read' do
    let(:id) { create_body[:result][:id] }

    it 'returns an object associated with an id' do
      expect(read_body[:result][:name]).to eq 'White Pizza'
    end
  end

  describe '#update' do
    let(:id) { create_body[:result][:id] }
    it "updates" do
      run("update -d '#{updated_attributes.merge(id: id).to_json}'")

      expect(read_body[:result][:name]).to eq 'Green Pizza'
    end
  end

  describe '#delete' do
    let(:id) { create_body[:result][:id] }
    it "deletes" do
      run("delete -d '{\"id\": \"#{id}\"}'")
      expect(read_body).to be_nil
    end
  end

  private

  def create_body
    run("create -d '#{pizza_attributes.to_json}'")[:body]
  end

  def read_body
    result = run("read -d '" + { id: id }.to_json + "'")
    return unless result
    result[:body]
  end
end
