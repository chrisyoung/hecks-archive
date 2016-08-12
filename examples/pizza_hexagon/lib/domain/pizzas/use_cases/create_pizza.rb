module PizzaHexagon::Domain::Pizzas::UseCases
  class CreatePizza
    attr_accessor :args, :id

    def initialize(args:, database_adapter:)
      @args             = args
      @database_adapter = database_adapter
    end

    def call(use_case=nil)
      create
      self
    end

    def errors
      @errors = []
    end

    private

    attr_accessor :database_adapter, :args

    def create
      return unless errors.empty?
      @id = database_adapter[:pizzas].create(name: args[:name])
    end
  end
end
