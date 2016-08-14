class PizzaHexagon
  module Clients
    module HTTP
      # Resources in the HTTP client map to domain aggregate modules
      class Resource
        attr_reader :name
        def initialize(constant_name)
          @name = constant_name.to_s.downcase
        end

        def to_param
          name.to_sym
        end
      end
    end
  end
end
