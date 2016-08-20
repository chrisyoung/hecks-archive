class Create
  def initialize(hexagon: hexagon)
    @hexagon = hexagon
  end

  def call(body:, module_name:)
    hexagon.run(
      module_name.to_sym,
      :create_pizza,
      JSON.parse(body.read, symbolize_names: true)
    )
  end

  private

  attr_accessor :hexagon
end
