module HecksConsole
  # mixin methods to the console
  module Commands
    def app
      @app ||= HecksApp
    end

    def domain_modules
      DOMAIN.domain_modules
    end

    def status
      ap({
        domain_name: DOMAIN.name,
        domain_module_names: DOMAIN.domain_modules.map { |dm| dm[0] },
        validator: app.validator,
        database: app.database
      })
    end
  end
end
