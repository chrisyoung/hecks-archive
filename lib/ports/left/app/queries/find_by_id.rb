# frozen_string_literal: true
module Hecks
  module Ports
    module Left
      class App
        module Queries
          class FindById
            def initialize(repository:)
              @repository = repository
            end

            def call(params)
              return unless params.keys == [:id]
              @repository.read(params[:id])
            end
          end
        end
      end
    end
  end
end
