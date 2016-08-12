class PizzaHexagon::Utilities
  class InMemoryDatabase
    def initialize(domain_repositories: PizzaHexagon::DOMAIN_REPOSITORIES)
      @domain_repositories = domain_repositories
    end

    def [] (module_name)
      @domain_repositories[module_name]
    end

    def delete_all
      @domain_repositories.values.each do |repository|
        repository.delete_all
      end
    end
  end
end
