require 'pry'
hexagon = {
  name: "pizzas",
  modules: [
    {
      name: "pizzas",
      objects: [
        {
          name: "pizza",
          attributes: {
            name:        :string,
            description: :string,
            toppings:    [:topping]
          },
          head: true
        },
        {
          name: "topping",
          attributes: {
            name: :string
          }
        }
      ]
    }
  ]
}

class Schema
  attr_reader :modules, :name
  def initialize(schema)
    @name = schema[:name]
    @modules = schema[:modules].map do |attributes|
      Module.new(attributes)
    end
  end
end

class Module
  attr_reader :name, :domain_objects

  def initialize(attributes)
    @name = attributes[:name]
    @domain_objects = attributes[:objects].map do |attributes|
      DomainObject.new(attributes)
    end
  end

  def head
    @domain_objects.each do |domain_object|
      return domain_object if domain_object.head?
    end
  end
end

class DomainObject
  attr_reader :name, :fields
  def initialize(attributes)
    @name   = attributes[:name]
    @head   = attributes[:head]
    @fields = attributes[:attributes].map do |attributes|
      Field.new(attributes)
    end
  end

  def head?
    !@head.nil?
  end
end

class Field
  attr_reader :name, :type
  def initialize(attributes)
    @name = attributes[0]
    @type = attributes[1]
  end
end

class Generate
  def initialize(hexagon)
    @schema = Schema.new(hexagon)
  end

  def call
    generate_hexagon
    generate_modules
  end

  private

  attr_reader :schema

  def generate_hexagon
    puts `../../bin/hecks new #{schema.name}`
  end

  def generate_modules
    schema.modules.each do |domain_module|
      puts `cd #{schema.name}_hexagon && ../../../bin/hecks domain:aggregate #{domain_module.name} -h #{domain_module.head.name} `
    end
  end
end

Generate.new(hexagon).call
