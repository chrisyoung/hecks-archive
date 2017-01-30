module SoccerSeason
  module Domain
    module Matches
      class PitchReference
        attr_accessor :id, :referenced_entity

        def initialize(id:)
          @id = id
          @referenced_entity = Pitches::Pitch
        end

        def to_json(config)
          JSON.generate({id: @id, referenced_entity: @referenced_entity})
        end
      end
    end
  end
end
