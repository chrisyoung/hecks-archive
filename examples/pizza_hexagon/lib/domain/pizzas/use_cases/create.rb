module PizzaHexagon::Domain::Pizzas::UseCases
  class Create
    attr_reader :args, :id, :errors

    def initialize(args:, database_adapter:, schema: PizzaHexagon::Domain::Pizzas::Schemas::CreatePizza)
      @args             = args
      @database_adapter = database_adapter
      @schema           = schema
    end

    def call(use_case=nil)
      validate
      create
      self
    end

    private

    attr_accessor :database_adapter, :args, :schema

    def validate
      @errors = schema.(args).messages
    end

    def create
      return if @errors.keys.count > 0
      @id = database_adapter[:pizzas].create(args)
    end
  end
end
