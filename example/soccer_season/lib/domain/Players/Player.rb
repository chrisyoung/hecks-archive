module SoccerSeason
  module Domain
    module Players
      class Player
        attr_accessor :name, :team, :id
        def initialize(name:, team:, id:)
        @name = name
@team = TeamReference.factory(team)
@id = id
        end

        def name=(name)
  @name = name
end

def team=(team)
  @team = TeamReference.factory(team)
end


        def to_json
          JSON.generate(name: name, team: team, id: id)
        end
      end
    end
  end
end
