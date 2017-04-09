# -*- encoding: utf-8 -*-
# stub: hecks-adapters-dynamodb 0.1.5.6 ruby lib

Gem::Specification.new do |s|
  s.name = "hecks-adapters-dynamodb".freeze
  s.version = "0.1.5.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Chris Young".freeze]
  s.date = "2017-04-03"
  s.description = "Hecks DynamoDB Database".freeze
  s.email = "chris@example.com".freeze
  s.homepage = "https://github.com/chrisyoung/hecks".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "Drive DynamoDB with Domains created with Hecks::Domain".freeze

  s.installed_by_version = "2.6.11" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<aws-sdk>.freeze, ["~> 2"])
    else
      s.add_dependency(%q<aws-sdk>.freeze, ["~> 2"])
    end
  else
    s.add_dependency(%q<aws-sdk>.freeze, ["~> 2"])
  end
end
