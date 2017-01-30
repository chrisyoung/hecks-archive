module SoccerSeason
  module Domain
    module Players
      class TeamReference
        attr_accessor :id, :referenced_entity

        def initialize(id:)
          @id = id
          @referenced_entity = Teams::Team
        end

        def to_json(config)
          JSON.generate({id: @id, referenced_entity: @referenced_entity})
        end
      end
    end
  end
end
