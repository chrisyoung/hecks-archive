module HecksDomain
  module CLI
    class CommandBuilder
      # Build a value object
      module ValueObjectCommandLineBuilder
        def self.build(domain, runner)
          domain.domain_modules.values.each do |domain_module|
            (domain_module.objects - [domain_module.head]).each do |value_object|
              command = [
                'generate domain_object',
                '-t', 'value_object',
                '-n', value_object.name,
                '-m', domain_module.name,
                '-a', value_object.attribute_string
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
end
