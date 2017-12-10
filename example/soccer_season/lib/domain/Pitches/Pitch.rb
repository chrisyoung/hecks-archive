module SoccerSeason
  module Domain
    module Pitches
      class Pitch
        attr_accessor :name, :id
        def initialize(attributes={})
          @name = attributes[:name]
          @id = attributes[:id]
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
