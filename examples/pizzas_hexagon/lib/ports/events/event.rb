module PizzasHexagon
  module Ports
    class Events
      class EventName
        def initialize(command)
          @command = command
        end

        def value
          @command.class.name.downcase
            .gsub("::", "_")
            .gsub('usecases_', '')
            .gsub('pizzashexagon_', '')
            .gsub("domain_", '').to_sym
        end
      end
    end
  end
end
