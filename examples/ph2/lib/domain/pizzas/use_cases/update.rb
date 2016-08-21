module Ph2::Domain::Pizzas::UseCases
  class Update
    attr_accessor :args, :errors, :id

    def initialize(args:, database_adapter:, schema: PizzaHexagon::Domain::Pizzas::Schemas::CreatePizza)
      @args       = args
      @id = args[:id]
      @database_adapter = database_adapter
      @schema = schema
    end

    def call(use_case=nil)
      validate
      update
      self
    end

    private

    attr_accessor :database_adapter, :schema

    def validate
      @errors = schema.(args[:attributes]).messages
    end

    def update
      return if @errors.keys.count > 0
      database_adapter[:pizzas].update(args[:id], args[:attributes])
    end
  end
end
