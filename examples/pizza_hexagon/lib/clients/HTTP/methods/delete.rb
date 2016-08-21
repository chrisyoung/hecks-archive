class Delete
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id:, module_name:)
    hexagon.run(
      module_name.to_sym,
      :delete_pizza,
      id: id
    )
  end

  private

  attr_accessor :hexagon
end
