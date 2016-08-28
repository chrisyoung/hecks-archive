class Topping < ActiveRecord::Base
  validates :name, uniqueness: true

  def self.upsert(toppings)
    toppings.each do |topping|
      new(name: topping["name"]).save
    end
  end
end
