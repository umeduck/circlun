class Api::V1::CirclesController < ApplicationController
  before_action :authenticate_api_v1_user!
  def create
    circle = Circle.new(circle_params)
    membership = nil
    ActiveRecord::Base.transaction do
      circle.save!
      membership = Membership.new(
        circle_id: circle.id,
        user_id: current_api_v1_user.id,
        role: 1
      )
      logger.info "circle.id: #{circle.id}"
      logger.info "user.id: #{current_api_v1_user.id}"
      membership.save!
    end
    render status: :created
  rescue ActiveRecord::RecordInvalid => e
    logger.error "[CREATE ERROR] #{e.class} - #{e.message}"
    logger.error "circle errors: #{circle&.errors&.full_messages || 'circle is nil'}"
    logger.error "Membership errors: #{membership&.errors&.full_messages || 'membership is nil'}"
    render json: { error: e.message }, status: :unprocessable_entity
  end

  private

  def circle_params
    params.require(:circle)
          .permit(:name, :kind, :objective, :avg_age, :count, :prefectures,
                  :foundation_years, :note)
  end
end