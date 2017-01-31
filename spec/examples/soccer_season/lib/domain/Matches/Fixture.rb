module SoccerSeason
  module Domain
    module Matches
      class Fixture
        attr_accessor :season, :date, :time

        def self.factory(group_attributes)
          return Fixture.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            Fixture.new(attributes)
          end
        end

        def initialize(season:, date:, time:)
          @season = season
@date = date
@time = time
        end

        def to_json(config)
          JSON.generate(season: season, date: date, time: time)
        end
      end
    end
  end
end
