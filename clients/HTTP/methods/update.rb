class Update
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id:, body:, module_name:)
    @id          = id.to_i
    @body        = body.read
    @module_name = module_name.to_sym
    run_command
  end

  private

  attr_accessor :hexagon, :id, :body, :module_name

  def run_command
    hexagon.run(module_name, :update, params)
  end

  def params
    JSON.parse(body, symbolize_names: true).merge(id: id)
  end
end
