class PizzasController < ApplicationController
  def create
    render json: Hexagon.run(
      :pizzas,
      :create,
      pizza_params
    ).to_h
  end

  def update
    render json: Hexagon.run(
      :pizzas,
      :update,
      pizza_params.merge(id: params[:id])
    ).to_h
  end

  def delete
    render json: Hexagon.run(
      :pizzas,
      :delete,
      params[:id].to_i
    ).to_h
  end

  def show
    render json: Hexagon.query(
      :pizzas,
      id: params[:id].to_i
    )
  end

  private

  def pizza_params
    params[:pizza].symbolize_keys
  end
end
