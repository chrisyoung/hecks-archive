module SoccerSeason
  module Domain
    module Players
      class TeamReference
        attr_accessor :id

        def self.factory(teamreference_group_attributes)
          teamreference_group_attributes.map do |attributes|
            TeamReference.new(attributes)
          end
        end

        def initialize(id:)
          @id = id
        end

        def to_json(config)
          JSON.generate(id: id)
        end
      end
    end
  end
end
