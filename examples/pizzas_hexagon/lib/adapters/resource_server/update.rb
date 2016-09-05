class Update
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id:, body:, module_name:)
    @id          = id.to_i
    @body        = body.read
    @module_name = module_name.to_sym
    run_command
    [JSON.generate(command_result.to_h) + "\n\n"]
  end

  private

  attr_accessor :hexagon, :id, :body, :module_name, :command_result

  def run_command
    @command_result = hexagon.run(module_name, :update, params)
  end

  def params
    JSON.parse(body, symbolize_names: true).merge(id: id)
  end

  def status
    return 500 if command_result.errors.count > 0
    return 200
  end
end
