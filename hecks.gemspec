Gem::Specification.new do |s|
  s.name        = 'hecks'
  s.homepage    = "https://github.com/chrisyoung/heckson"
  s.version     = '0.0.0'
  s.date        = '2016-09-12'
  s.summary     = "DDD and Hexagonal Code Generators"
  s.description = "Make the Domain the center of your programming world"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'thor', "~>0.19"
  # s.add_runtime_dependency 'active_support'
  s.add_runtime_dependency 'sequel'
  s.add_runtime_dependency 'mysql2'


  s.executables << 'hecks'
end
