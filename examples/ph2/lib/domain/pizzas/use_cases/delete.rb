module Ph2::Domain::Pizzas::UseCases
  class Delete
    attr_accessor :args

    def initialize(args:, database_adapter:)
      @args       = args
      @database_adapter = database_adapter
    end

    def call(use_case=nil)
      delete
      self
    end

    def errors
      []
    end

    private

    attr_accessor :database_adapter


    def delete
      database_adapter[:pizzas].delete(args[:id])
    end
  end
end
