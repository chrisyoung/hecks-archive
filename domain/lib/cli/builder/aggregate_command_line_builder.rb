module HecksDomain
  module CLI
    class CommandBuilder
      # Build an aggregate
      module AggregateCommandLineBuilder
        def self.build(domain, runner)
          domain.domain_modules.values.each do |domain_module|
            runner.call(
              [
                'generate domain_object',
                '-t', 'aggregate',
                '-n', domain_module.name,
                '--head_name', domain_module.head.name,
                '-a', domain_module.head.attribute_string
              ])
          end
        end
      end
    end
  end
end
