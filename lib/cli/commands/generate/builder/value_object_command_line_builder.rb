module Hecks
  class Builder
    module ValueObjectCommandLineBuilder
      def self.build(domain, runner)
        domain.domain_modules.values.each do |domain_module|
          (domain_module.objects - [domain_module.head]).each do |value_object|
            runner.call([
              'generate domain_object',
              '-t', 'value_object',
              '-n', value_object.name,
              '-m', domain_module.name,
              '-a', value_object.attribute_string
            ])
          end
        end
      end
    end
  end
end
