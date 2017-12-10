module HecksFormHelperExtension
  class Model
    def initialize(name, persisted)
      @name = name
      @persisted = persisted
    end

    def model_name
      ModelName.new(@name)
    end

    def to_key
      [@name]
    end

    def persisted?
      @persisted
    end
  end
end
