require 'hecks-application'
require 'hecks-adapters'
require 'pizza_builder'

app = Hecks::Application.new(
  domain: PizzaBuilder,
  database: Hecks::Adapters::SQLDatabase
)

# Ruby 2.2.2 doesn't support Fixnum#positive?, so monkey patch it.
class Fixnum
  def positive?
    self > 0
  end
end

domain_module = ARGV[0].to_sym
method = ARGV[1]
data = JSON.parse(ARGV[2], symbolize_names: true)

puts app[domain_module].send(method, data).call.result.inspect
