class Server < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, '9292'

  def initialize(app: nil, hexagon:)
    super(app)
    @methods = Methods.new(hexagon: hexagon)
  end

  Domain.modules.each do |name|
    post "/#{name}" do
      result = methods.create.call(body: request.body, module_name: name)
    end

    get "/#{name}/:id" do |id|
      methods.read.call(id: id, module_name: name)
    end

    put "/#{name}/:id" do |id|
      methods.update.call(id: id, body: request.body, module_name: name)
    end

    delete "/#{name}/:id" do |id|
      methods.delete.call(id: id, module_name: name)
    end
  end

  private

  attr_reader :methods
end
