# -*- encoding: utf-8 -*-
# stub: hecks-application 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "hecks-application".freeze
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Young".freeze]
  s.date = "2017-03-16"
  s.description = "Hecks Application".freeze
  s.email = "chris@example.com".freeze
  s.homepage = "https://github.com/chrisyoung/hecks-application".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Hecks::Application understands things and acts as an interface to Domains built with Hecks::Domain".freeze

  s.installed_by_version = "2.6.10" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hecks-domain>.freeze, ["= 0.1.2"])
    else
      s.add_dependency(%q<hecks-domain>.freeze, ["= 0.1.2"])
    end
  else
    s.add_dependency(%q<hecks-domain>.freeze, ["= 0.1.2"])
  end
end
