class Delete
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id:, module_name:)
    @id          = id
    @module_name = module_name.to_sym
    run_command
  end

  private

  attr_reader :hexagon, :module_name, :id

  def run_command
    hexagon.run(module_name, :delete_pizza, id: id.to_i)
  end
end
