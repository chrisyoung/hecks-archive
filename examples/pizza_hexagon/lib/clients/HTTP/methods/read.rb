class Read
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id:, module_name:)
    hexagon.query(
      module_name.to_sym,
      { id: id }
    ).to_json
  end

  private

  attr_reader :hexagon
end
