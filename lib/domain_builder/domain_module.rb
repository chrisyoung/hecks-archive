class DomainModule
  attr_reader :name, :domain_objects

  def initialize(domain_module)
    @name = domain_module.name

    @domain_objects = domain_module.objects.map do |object|
      DomainObject.new(object, @name)
    end
  end

  def head
    domain_objects.each do |domain_object|
      return domain_object if domain_object.head?
    end
  end

  def value_objects
    domain_objects - [head]
  end

  private

  attr_reader :domain_objects
end
