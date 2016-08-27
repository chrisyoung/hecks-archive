module Ph2::Domain::Pizzas::UseCases
  class Delete
    attr_accessor :args

    def initialize(args:, database:)
      @args     = args
      @database = database
    end

    def call(use_case=nil)
      delete
      self
    end

    def errors
      []
    end

    private

    attr_accessor :database


    def delete
      database[:pizzas].delete(args[:id])
    end
  end
end
