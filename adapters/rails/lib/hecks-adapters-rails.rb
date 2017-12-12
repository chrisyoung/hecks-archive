require_relative 'form_helper_extension'
load('Hecksfile')
HA = HecksApp

module HecksAdapters
  module Rails
    HecksApplication.include(
      FormHelperExtension::RegisterModels
    )
  end
end
