require 'Date'
Gem::Specification.new do |s|
  version = File.read("../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-serverless'
  s.homepage    = "https://github.com/chrisyoung/hecks-serverless"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Run your domain without a server"
  s.description = "Hecks Serverless"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"]
  s.license     = 'MIT'

  s.executables << 'hecks_serverless'

  s.add_runtime_dependency 'thor', '~>0.19'
end
