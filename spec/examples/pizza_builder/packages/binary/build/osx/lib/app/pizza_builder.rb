require 'hecks'
require 'pizza_builder'

app = Hecks::Adapters::Application.new(domain: PizzaBuilder)

# Ruby 2.2.2 doesn't support Fixnum#positive?, so monkey patch it.
class Fixnum
  def positive?
    self > 0
  end
end

puts app[ARGV[0].to_sym].create(JSON.parse(ARGV[1], symbolize_names: true)).call.result.inspect
