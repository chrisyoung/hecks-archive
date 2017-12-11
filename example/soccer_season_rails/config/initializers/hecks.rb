HA = HecksApplication.new(domain: SoccerSeason)
HecksApplication.include(
  HecksAdapters::Rails::FormHelperExtension::RegisterModels
)
