class Topping < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.save_toppings(toppings)
    toppings.each do |topping|
      new(name: topping["name"]).save
    end
  end
end
