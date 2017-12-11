module HecksAdapters
  module Rails
    module FormHelperExtension
      # A model with methods to interact with Rails form
      # helpers
      class Model
        def initialize(name, persisted, id)
          @name = name
          @persisted = persisted
          @id = id
        end

        def model_name
          ModelName.new(@name)
        end

        def to_key
          [@id]
        end

        def persisted?
          @persisted
        end

        def to_s
          @id
        end
      end
    end
  end
end
