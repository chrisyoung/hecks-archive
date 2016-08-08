class Server::CreatePizza
  def initialize(app, params)
    @app    = app
    @params = params
  end

  def call
    app.run Commands::CreateReaction.new(params) do
      success? { write_response('success') }
      fail?    { write_response('fail') }
    end
  end

  private

  attr_accessor :app, :params

  def write_response response
    Rack::Response.new.write(result: response).finish
  end
end
