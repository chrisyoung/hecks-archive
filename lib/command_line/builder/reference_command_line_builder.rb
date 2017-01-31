module Hecks
  class Builder
    module ReferenceCommandLineBuilder
      def self.build(domain, runner)
        domain.domain_modules.each do |domain_module|
          domain_module.references.each do |reference|
            runner.call([
              'generate:domain_object',
              '-t', 'reference',
              '-n', reference.name,
              '-m', domain_module.name,
              '-r', reference.referenced_entity
            ])
          end
        end
      end
    end
  end
end
