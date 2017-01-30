module SoccerSeason
  module Domain
    module Matches
      class PitchReference
        attr_accessor :id

        def self.factory(pitchreference_group_attributes)
          pitchreference_group_attributes.map do |attributes|
            PitchReference.new(attributes)
          end
        end

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
