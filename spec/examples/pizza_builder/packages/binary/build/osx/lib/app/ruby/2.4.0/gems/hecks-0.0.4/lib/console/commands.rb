module Hecks
  module Console
    module Commands
      def app
        @app ||= Hecks::Adapters::Application.new(domain: Hecks::Console.domain)
      end
    end
  end
end
