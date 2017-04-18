describe 'Serverless Tests' do
  def run(command)
    result = `cd hecks-examples/pizza_builder && serverless invoke local -f pizzas_#{command}`.gsub("result ", '')
    eval(result) if result != "null\n"
  end

  let(:pizza_attributes) {
    PIZZA_ATTRIBUTES.to_json
  }

  let(:updated_attributes) {
    PIZZA_ATTRIBUTES.merge(name: "Green Pizza")
  }

  describe '#create' do
    it 'returns an id' do
      expect(run("create -d '#{pizza_attributes}'")[:body][:result][:id]).to_not be_nil
    end
  end

  describe '#read' do
    let(:id) { run("create -d '#{pizza_attributes}'")[:body][:result][:id] }
    it 'returns an object associated with an id' do
      expect(run("read -d '{\"id\": \"#{id}\"}'")[:body][:result][:name]).to eq 'White Pizza'
    end
  end

  describe '#update' do
    let(:id) { run("create -d '#{pizza_attributes}'")[:body][:result][:id] }
    it do
      run("update -d '#{updated_attributes.merge(id: id).to_json}'")
      expect(run("read -d '{\"id\": \"#{id}\"}'")[:body][:result][:name]).to eq 'Green Pizza'
    end
  end

  describe '#delete' do
    let(:id) { run("create -d '#{pizza_attributes}'")[:body][:result][:id] }
    it do
      run("delete -d '{\"id\": \"#{id}\"}'")
      expect(run("read -d '{\"id\": \"#{id}\"}'")).to be_nil
    end
  end
end
