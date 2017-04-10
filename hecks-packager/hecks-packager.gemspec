require 'Date'
Gem::Specification.new do |s|
  version = File.read("../hecks-application/lib/Version").gsub("\n", '')
  s.name        = 'hecks-packager'
  s.homepage    = "https://github.com/chrisyoung/hecks-domain"
  s.version     = version
  s.date        = Date.today
  s.summary     = "Package your domain driven application as a binary"
  s.description = "Hecks Packager"
  s.authors     = ["Chris Young"]
  s.email       = 'chris@example.com'
  s.files       = Dir["lib/**/*"] + Dir["build/**/*"] + Dir["resources/**/*"]
  s.license     = 'MIT'

  s.executables << 'hecks-package'
end
