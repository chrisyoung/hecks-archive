class ApplicationController < ActionController::Base
  HA = HecksApplication.new(domain: SoccerSeason)
  protect_from_forgery with: :exception
end
