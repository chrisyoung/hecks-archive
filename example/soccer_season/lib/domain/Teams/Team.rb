module SoccerSeason
  module Domain
    module Teams
      class Team
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
