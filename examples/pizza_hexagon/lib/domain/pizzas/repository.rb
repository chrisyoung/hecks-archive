module PizzaHexagon::Domain::Pizzas
  # This is the default "in memory" Pizzas Repository.
  # When developing the domain, the in-memory repo makes it things fast to test
  # without mocking.  A repository is only able to do operations on the aggregate
  # head (Pizzas::Pizza).  There
  # can be only one repository per module in the domain.
  class Repository
    @collection = {}
    @last_id = 0

    def self.create(attributes={})
      id = @last_id + 1
      @collection[id] = Pizza.new(attributes.merge(id: id))
      @last_id = id
    end

    def self.update id, attributes
      fixture = read(id.to_i)

      attributes.each do |field, value|
        fixture.send("#{field}=", value)
      end

      fixture
    end

    def self.read id
      @collection[id]
    end

    def self.query(args={})
      Query.new(repository: self).call(args)
    end

    def self.delete(id)
      @collection.delete(id.to_i)
    end

    def self.delete_all
      @collection = {}
      @last_id = 0
    end
  end
end
