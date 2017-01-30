module SoccerSeason
  module Domain
    module Teams
      class Team
        attr_accessor :name, :players, :id
        def initialize(name:, players:, id:)
        @name = name
@players = Player.factory(players)
@id = id
        end

        def to_json
          JSON.generate(name: name, players: players, id: id)
        end
      end
    end
  end
end
