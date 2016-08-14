class PizzaHexagon
  module Domain
    def self.modules
      constants
    end
  end
end

Dir[File.dirname(__FILE__) + "/domain/**/*.rb"].each { |file| require file }
