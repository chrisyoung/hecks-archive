module HecksConsole
  module Commands
    def app
      @app ||= HecksApplication.new(domain: Hecks::Console.domain)
    end
  end
end
