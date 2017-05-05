# frozen_string_literal: true
module HecksAdapters
  # The default database adapter
  class MemoryDatabase
    def initialize(domain:)
      @repositories = domain.repositories
    end

    def [](module_name)
      @repositories[module_name.to_s.downcase.to_sym]
    end

    def delete_all
      @repositories.values.each(&:delete_all)
    end
  end
end
