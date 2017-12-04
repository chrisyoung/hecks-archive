module SoccerSeason
  module Domain
    module Teams
      class GoalReference
        attr_accessor :id, :referenced_entity

        def self.factory(group_attributes)
          return GoalReference.new(group_attributes) unless group_attributes.is_a?(Array)
          group_attributes.map do |attributes|
            GoalReference.new(attributes)
          end
        end

        def initialize(id:)
          @id = id
          @referenced_entity = Fixtures::Goal
        end

        def to_json(config)
          JSON.generate({id: @id, referenced_entity: @referenced_entity})
        end
      end
    end
  end
end
