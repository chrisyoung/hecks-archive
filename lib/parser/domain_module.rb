class DomainModule
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

  def value_objects
    @domain_objects - [head]
  end
end
