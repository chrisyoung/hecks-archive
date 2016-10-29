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
