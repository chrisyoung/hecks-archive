module SoccerSeason
  module Domain
    module Fixtures
      class Repository
        @collection = {}

        def self.create attributes={}
          id              = attributes[:id]
          @collection[id] = Fixture.new(attributes)
          Struct.new(:id).new(id)
        end

        def self.update id, attributes
          entity = read id

          return unless entity
          attributes.each do |field, value|
            entity.send("#{field}=", value)
          end

          entity
        end

        def self.read id
          @collection[id]
        end

        def self.delete(id)
          @collection.delete(id)
        end

        def self.delete_all
          @collection = {}
        end
      end
    end
  end
end
