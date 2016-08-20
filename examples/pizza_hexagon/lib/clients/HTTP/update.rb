class Update
  def initialize(hexagon:)
    @hexagon = hexagon
  end

  def call(id, body, module_name)
    @id = id
    @body = JSON.parse(body.read, symbolize_names: true)

    hexagon.run(
      module_name.to_sym,
      :update_pizza,
      @body.merge(id: id)
    )
  end

  private

  attr_accessor :hexagon
end
