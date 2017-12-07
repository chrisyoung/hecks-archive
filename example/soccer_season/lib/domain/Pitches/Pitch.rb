module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        attr_accessor :name, :id
        def initialize(name:, id:)
        @name = name
@id = id
        end

        def name=(name)
          @name = name
        end


        def to_json
          JSON.generate(name: name, id: id)
        end
      end
    end
  end
end
