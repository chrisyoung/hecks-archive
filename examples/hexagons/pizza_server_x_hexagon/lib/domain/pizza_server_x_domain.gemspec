Gem::Specification.new do |s|
  s.name        = 'pizza_server_x_domain'
  s.version     = '0.0.0'
  s.authors     = ['Who are you?']
  s.summary     = "PizzaServerXHexagon Domain"
  s.files       = Dir["lib/**/*"]

  # s.homepage    = ''
  # s.date        = ''
  # s.description = ""
  # s.email       = ''
  # s.license     = ''

  s.add_development_dependency 'rspec',       '~> 3.5'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'simplecov',   '~> 0.12'
end
