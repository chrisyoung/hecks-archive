module Hecks
  class Builder
    module AggregateCommandLineBuilder
      def self.build(domain, runner)
        domain.domain_modules.each do |domain_module|
          runner.call(
            [
              'generate:domain_object',
              '-t', 'aggregate',
              '-n', domain_module.name,
              '--head_name', domain_module.head.name,
              '-a', domain_module.head.attributes
            ])
        end
      end
    end
  end
end
