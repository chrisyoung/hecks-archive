class GenerateDomainMigrations < Thor::Group
  class MigrationBuilder
    TYPE_MAP = {
      'Currency' => "BigDecimal",
      'String'   => 'String',
      'Integer'  => 'Integer'
    }

    def initialize(generator, specification)
      @generator = generator
      @domain_spec = specification
    end

    def call
      generate_migrations
      self
    end

    def table_name
      @object.name.underscore.pluralize
    end

    def attributes
      @object.attributes.map do |attribute|
        next unless TYPE_MAP[attribute.type]
        attribute.copy(type: TYPE_MAP[attribute.type])
      end.compact
    end

    private

    attr_reader :domain_spec, :generator

    def domain_objects
      domain_spec.domain_modules.values.flat_map(&:objects)
    end

    def file_name(index, object)
      "#{index}_create_#{table_name}.rb"
    end

    def generate_migrations
      domain_objects.each.with_index(1) do |object, index|
        @object = object
        @generator.template(
          "migration.rb.tt",
          "db/migrations/" + file_name(index, object)
        )
      end
    end
  end
end
