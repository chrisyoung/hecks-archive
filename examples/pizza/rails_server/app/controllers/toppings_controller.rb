class ToppingsController < ApplicationController
  def index
    render json: Topping.all.map(&:name)
  end
end
