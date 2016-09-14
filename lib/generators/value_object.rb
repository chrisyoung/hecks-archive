require 'active_support/inflector'

class Hecks < Thor
  class ValueObject < Thor::Group
    include Thor::Actions
  end
end
