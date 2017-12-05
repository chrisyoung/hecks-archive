module HecksDomain
  module CLI
    class CommandBuilder
      # Build an aggregate
      module AggregateCommandLineBuilder
        def self.build(domain, runner)
          domain.domain_modules.values.each do |domain_module|
            command = [
              'generate domain_object',
              '-t', 'aggregate',
              '-n', domain_module.name,
              '--head_name', domain_module.head.name,
              '-a', domain_module.head.attribute_string
            ]
            unless domain_module.head.optional_attribute_string.empty?
              command = command + ['-o', domain_module.head.optional_attribute_string]
            end
            runner.call(command)
          end
        end
      end
    end
  end
end
