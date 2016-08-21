class Create
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(body:, module_name:)
    @body        = body.read
    @module_name = module_name.to_sym
    run_command
  end

  private

  attr_reader :hexagon, :body, :module_name

  def run_command
    hexagon.run(module_name, :create_pizza, params)
  end

  def params
    JSON.parse(body, symbolize_names: true)
  end
end
