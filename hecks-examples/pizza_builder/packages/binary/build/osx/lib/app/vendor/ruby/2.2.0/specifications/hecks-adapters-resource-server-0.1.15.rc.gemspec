# -*- encoding: utf-8 -*-
# stub: hecks-adapters-resource-server 0.1.15.rc ruby lib

Gem::Specification.new do |s|
  s.name = "hecks-adapters-resource-server".freeze
  s.version = "0.1.15.rc"

  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Young".freeze]
  s.date = "2017-03-15"
  s.description = "Hecks HTTP Resource Server".freeze
  s.email = "chris@example.com".freeze
  s.homepage = "https://github.com/chrisyoung/hecks-domain".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Drive a resourceful web server with Domains created using Hecks::Domain generators".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hecks-application>.freeze, ["= 0.1.15.rc"])
      s.add_runtime_dependency(%q<sinatra>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<rack-test>.freeze, ["~> 0.6"])
    else
      s.add_dependency(%q<hecks-application>.freeze, ["= 0.1.15.rc"])
      s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
      s.add_dependency(%q<rack-test>.freeze, ["~> 0.6"])
    end
  else
    s.add_dependency(%q<hecks-application>.freeze, ["= 0.1.15.rc"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 1.4"])
    s.add_dependency(%q<rack-test>.freeze, ["~> 0.6"])
  end
end
