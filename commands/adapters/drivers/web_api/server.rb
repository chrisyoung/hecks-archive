class Server
  def initialize(hexagon)
    @hexagon = hexagon
  end

  def call(env)
    request = Rack::Request.new(env)

    Rack::Builder.app do
      map '/pizzas' do
        run CreatePizza.new(app: hexagon, params: params)
      end
    end
  end

  private

  attr_accessor :hexagon

end
