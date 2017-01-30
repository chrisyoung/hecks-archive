module SoccerSeason
  module Domain
    module Matches
      class PitchReference
        attr_accessor :id, :module, :object

        def self.factory(pitch_reference_group_attributes)
          pitch_reference_group_attributes.map do |attributes|
            PitchReference.new(attributes)
          end
        end

        def initialize(id:, module:, object:)
          @id = id
@module = Pitches.new(module)
@object = Pitch.new(object)
        end

        def to_json(config)
          JSON.generate(id: id, module: module, object: object)
        end
      end
    end
  end
end
