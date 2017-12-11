module HecksAdapters
  module Rails
    module FormHelperExtension
      module RegisterModels
        def self.included(base_klass)
          DOMAIN.domain_modules.each do |domain_module|
            domain_module = domain_module[1]
            domain_module.objects.each do |object|
              SoccerSeason::Domain
                .const_get(domain_module.name)
                .const_get(object.name)
                .prepend HecksAdapters::Rails::FormHelperExtension
            end
          end
        end
      end
    end
  end
end
