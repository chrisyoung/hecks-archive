require_relative 'commands/create'
require_relative 'commands/update'
require_relative 'commands/delete'
require_relative 'repositories/pizzas'
require_relative 'queries/read'

require_relative 'config'
[ '/models/*.rb', '/repositories/*.rb'].each do |file|
  Dir[File.dirname(__FILE__) + file].each { |file| require file }
end

module Hecks
  module Adapters
    class SQLDatabase
      def initialize(domain)
        @domain = domain
      end

      def [](repository_name)
        { pizzas: Repositories::Pizzas.new }[repository_name]
      end
    end
  end
end
