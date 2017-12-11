class PitchesController < ApplicationController
  def new
    @pitch = SoccerSeason::Domain::Pitches::Pitch.new
  end

  def create
    redirect_to(edit_pitch_path(
      HA[:pitches].create(pitch_params).result[:id]
    ))
  end

  def edit
    @pitch = HA[:pitches].read(params[:id])
  end

  def show
    @pitch = HA[:pitches].read(params[:id])
  end

  def update
    HA[:pitches].update(pitch_params.merge(id: params[:id]))
    redirect_to(edit_pitch_path(params[:id]))
  end

  private

  def pitch_params
    params.require(:pitch).permit(:name).to_h.symbolize_keys
  end
end
