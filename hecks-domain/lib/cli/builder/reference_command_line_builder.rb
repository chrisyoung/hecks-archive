module HecksDomain
  module CLI
    class CommandBuilder
      # Build a Reference object
      module ReferenceCommandLineBuilder
        def self.build(domain, runner)
          domain.domain_modules.values.each do |domain_module|
            domain_module.references.each do |reference|
              runner.call([
                'generate domain_object',
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
end
