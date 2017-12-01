require_relative('runner')

describe 'Serverless Tests' do
  let(:pizza_attributes)   { PIZZA_ATTRIBUTES.to_json }
  let(:updated_attributes) do
    PIZZA_ATTRIBUTES.merge(
      name: "Green Pizza",
      id: id
    ).to_json
  end

  describe '#create' do
    it 'returns an id' do
      expect(create[:id]).to_not be_nil
    end
  end

  describe '#read' do
    let(:id) { create[:id] }

    it 'returns an object associated with an id' do
      expect(read[:name]).to eq 'White Pizza'
    end
  end

  describe '#update' do
    let(:id) { create[:id] }
    before   { update }

    it "updates" do
      expect(read[:name]).to eq 'Green Pizza'
    end
  end

  describe '#delete' do
    let(:id) { create[:id] }
    before { delete }
    it "deletes" do
      expect(read).to be_nil
    end
  end

  private

  def create
    run("create -d '#{pizza_attributes}'")[:body][:result]
  end

  def read
    result = run("read -d '" + { id: id }.to_json + "'")
    return unless result
    result[:body][:result]
  end

  def update
    run("update -d '#{updated_attributes}'")
  end

  def delete
    run("delete -d '{\"id\": \"#{id}\"}'")
  end

  def run(command)
    runner = Runner.new(command_name: command).call.result
  end
end
