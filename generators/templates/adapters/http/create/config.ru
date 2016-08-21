# run the Smaller Web Hexagon from a browser

require '../../../../reactions.rb'
require './server.rb'

app = Server.new(Reactions.new)

run app
