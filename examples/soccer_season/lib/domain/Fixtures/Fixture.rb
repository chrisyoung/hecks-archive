module SoccerSeason
  module Domain
    module Fixtures
      class Fixture
        attr_accessor :date, :match, :id
        def initialize(date:, match:, id:)
        @date = date
@match = Match.new(match)
@id = id
        end

        def to_json
          JSON.generate(date: date, match: match, id: id)
        end
      end
    end
  end
end
