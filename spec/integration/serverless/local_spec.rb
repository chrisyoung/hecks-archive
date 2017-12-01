describe 'Serverless Tests' do
  let(:pizza_attributes)   { PIZZA_ATTRIBUTES.to_json }
  let(:updated_attributes) { PIZZA_ATTRIBUTES.merge(name: "Green Pizza", id: id).to_json }

  describe '#create' do
    it 'returns an id' do
      expect(create[:result][:id]).to_not be_nil
    end
  end

  describe '#read' do
    let(:id) { create[:result][:id] }

    it 'returns an object associated with an id' do
      expect(read[:result][:name]).to eq 'White Pizza'
    end
  end

  describe '#update' do
    let(:id) { create[:result][:id] }
    it "updates" do
      run("update -d '#{updated_attributes}'")
      expect(read[:result][:name]).to eq 'Green Pizza'
    end
  end

  describe '#delete' do
    let(:id) { create[:result][:id] }
    it "deletes" do
      run("delete -d '{\"id\": \"#{id}\"}'")
      expect(read).to be_nil
    end
  end

  private

  def create
    run("create -d '#{pizza_attributes}'")[:body]
  end

  def read
    result = run("read -d '" + { id: id }.to_json + "'")
    return unless result
    result[:body]
  end

  def run(command)
    full_command = "cd example/pizza_builder && serverless invoke local -f pizzas_#{command}"
    result = `#{full_command}`
    JSON.parse(result, symbolize_names: true) unless result.include? "null"
  end
end
