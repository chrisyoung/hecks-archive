module Hecks
  module Adapters
    class Application
      module Schemas
        Delete = {
          type:       "object",
          required:   [:id],
          properties: {
            id: { type: 'integer' }
          }
        }
      end
    end
  end
end
