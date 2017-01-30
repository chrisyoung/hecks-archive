module SoccerSeason
  module Domain
    module Matches
      class PitchReference
        attr_accessor :id

        def initialize(id:)
          @id = id
        end

        def to_json(config)
          JSON.generate(id: id)
        end
      end
    end
  end
end
