describe Hecks do
  describe ".version" do
    it 'Matches the file' do
      expect(HecksApplication.version).to eq File.read("hecks-application/lib/Version").gsub("\n", '')
    end

    it 'is not be empty' do
      expect(HecksApplication.version).to_not eq ''
      expect(HecksApplication.version).to_not be_nil
    end
  end
end
