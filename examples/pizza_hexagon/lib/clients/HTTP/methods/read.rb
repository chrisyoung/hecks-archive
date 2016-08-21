class Read
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id:, module_name:)
    @id          = id.to_i
    @module_name = module_name.to_sym
    run_query
  end

  private

  attr_reader :hexagon, :id, :module_name

  def run_query
    hexagon.query(module_name, id: id).to_json
  end
end
