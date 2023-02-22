class Api::V1::CalendarsController < Api::V1::BaseController
  def index
    @calendars = Calendar.where(user: @user)
    render json: @calendars.to_json
  end

  def create
    @calendar = Calendar.create!(**calendar_params, user: @user)
    render json: @calendar.to_json
  end

  private

  def calendar_params
    params.permit(:title)
  end
end
