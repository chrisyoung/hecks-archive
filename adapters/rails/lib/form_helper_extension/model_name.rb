module HecksAdapters
  module Rails
    module FormHelperExtension
      # Maps attributes of a hecks model to attributes attributes
      # to interact with Rails form helpers
      class ModelName
        def initialize(name)
          @name = name
        end

        def param_key
          @name
        end

        def i18n_key
          param_key
        end

        def human
          @name
        end

        def singular_route_key
          @name
        end

        def route_key
          @name.pluralize
        end
      end
    end
  end
end
