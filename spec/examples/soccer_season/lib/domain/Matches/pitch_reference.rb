module SoccerSeason
  module Domain
    module Matches
      class PitchReference
        attr_accessor :id, :referenced_entity

        def self.factory(group_attributes)
          return PitchReference.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            PitchReference.new(attributes)
          end
        end

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