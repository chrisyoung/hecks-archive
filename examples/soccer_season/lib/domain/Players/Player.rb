module SoccerSeason
  module Domain
    module Players
      class Player
        attr_accessor :name, :id
        def initialize(name:, id:)
        @name = name
@id = id
        end

        def to_json
          JSON.generate(name: name, id: id)
        end
      end
    end
  end
end
