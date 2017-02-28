require 'hecks'
load '../../HECKS'

module PizzaBuilder
  module Adapters
    module SQLDatabase
      class GenerateDomainMigrations
        def call
          pizza_builder = Hecks.specification
          pizza_builder.domain_modules.values.each do |domain_module|
            domain_module.objects.each do |domain_object|
              puts domain_object.inspect
            end
          end
        end
      end
    end
  end
end

PizzaBuilder::Adapters::SQLDatabase::GenerateDomainMigrations.new.call
