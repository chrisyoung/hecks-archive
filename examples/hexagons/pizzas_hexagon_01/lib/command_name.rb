module PizzasHexagon
  class CommandName
    def initialize(command)
      @command = command
    end

    def name
      parts.last.to_sym
    end

    def module
      parts.first.to_sym
    end

    def to_sym
      @command.class.name.downcase
        .gsub("::", "_")
        .gsub('commands_', '')
        .gsub('pizzashexagon_', '')
        .gsub("domain_", '').to_sym
    end

    private

    def parts
      to_sym.to_s.split("_")
    end
  end
end
