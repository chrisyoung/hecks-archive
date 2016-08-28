class Topping < ActiveRecord::Base
  validates :name, uniqueness: true
end
