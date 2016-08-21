class Server
  def initialize(hex_app)
    @app = hex_app
  end

  def call(env) # hooks into the Rack Request chain
    request = Rack::Request.new(env)

    app.run_command(create_reaction_command) do |command|
      command.on_success do
        write_response({ create_reaction_command: { result: 'success' } })
      end
      command.on_fail do

      end
    end
  end

  private

  attr_accessor :app

  def write_response(response)
    Rack::Response.new.write(response).finish
  end

  def create_reaction_command
    Reactions::CreateReaction.new(
      type:       'like',
      product_id: 1,
      site_id:    'tanga',
      user_id:    1
    )
  end
end
