describe Hecks do
  describe ".version" do
    it do
      expect(Hecks.version).to eq File.read("Version").gsub("\n", '')
    end
  end
end
