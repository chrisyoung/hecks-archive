puts `cd lib/domain && gem build pizzas_domain.gemspec`
puts `cd lib/domain && gem install pizzas_domain-0.0.0.gem --no-rdoc`
puts `gem build pizzas_hexagon.gemspec`
puts `gem install pizzas_hexagon-0.0.1.gem --no-rdoc`
