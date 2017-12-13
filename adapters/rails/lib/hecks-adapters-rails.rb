require_relative 'form_helper_extension'
load('Hecksfile')
HA = HecksApp

module HecksAdapters
  module Rails
    # Add methods that are friendly with Rails form helpers, like
    # #form_for
    DOMAIN.domain_modules.each do |domain_module|
      domain_module = domain_module[1]
      domain_module.objects.each do |object|
        HA.domain::Domain
          .const_get(domain_module.name)
          .const_get(object.name)
          .prepend FormHelperExtension
      end
    end
  end
end
