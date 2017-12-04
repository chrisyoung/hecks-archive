module SoccerSeason
  module Domain
    module Teams
      class Team
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
