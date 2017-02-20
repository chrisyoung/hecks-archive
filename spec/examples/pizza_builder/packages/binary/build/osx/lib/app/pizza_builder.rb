require 'hecks'
require 'pizza_builder'

app = Hecks::Adapters::Application.new(domain: PizzaBuilder)
args = JSON.parse(ARGV[1], symbolize_names: true)

# Ruby 2.2.2 doesn't support Fixnum#positive?, so monkey-patch it.
class Fixnum
  def positive?
    self > 0
  end
end

pp app[ARGV[0].to_sym].create(args).call
