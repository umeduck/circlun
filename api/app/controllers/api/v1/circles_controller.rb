class Api::V1::CirclesController < ApplicationController
  def create
    CircleManager.create!(circle_params)
    render status: :created
  end

  private

  def circle_params
    params.require(:circle)
          .permit(:name, :kind, :objective, :avg_age, :count, :prefectures,
                  :foundation_years, :note)
  end
end