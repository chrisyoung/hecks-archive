class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    def initialize(generator)
      @generator = generator
      @domain_spec = Hecks.specification
    end

    def call
      @domain_spec.domain_modules.values.each.with_index(1) do |domain_module, index|
        domain_module.objects.each do |object|
          @object = object
          @generator.template "migration.rb.tt", "#{index}_create_#{object.name.underscore}_table.rb"
        end
      end
      self
    end

    def table_name
      @object.name
    end

    def attributes
      @object.attributes
    end
  end
end
