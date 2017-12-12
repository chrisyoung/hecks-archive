require_relative 'form_helper_extension'

HA = HecksApplication.new(domain: ENV['DOMAIN'].constantize)

module HecksAdapters
  module Rails
    HecksApplication.include(
      FormHelperExtension::RegisterModels
    )
  end
end
