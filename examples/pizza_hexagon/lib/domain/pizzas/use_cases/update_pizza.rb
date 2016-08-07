module PizzaHexagon::Domain::Pizzas::UseCases
  class UpdatePizza
    attr_accessor :args

    def initialize(args:, database_adapter:, validators: [Validator.new])
      @args       = args
      @database_adapter = database_adapter
      @validators = validators
    end

    def call(use_case=nil)
      validate
      update
      self
    end

    def errors
      @errors = validators.flat_map { |validator| validator.errors }
    end

    private

    attr_accessor :database_adapter, :validators

    def validate
      validators.each do |validator|
        validator.call(self)
      end
    end

    def update
      database_adapter[:pizzas].update(id: args[:id], attributes: args[:attributes])
    end
  end
end
