class Api::V1::CalendarsController < Api::V1::BaseController
  before_action :fetch_calendar_params, only: :create

  def index
    @calendars = Calendar.where(user: @user)
    render json: @calendars.to_json
  end

  def create
    begin
      @calendar = Calendar.create!(@calendar_params, user: @user)
      render json: @calendar.to_json
    rescue => e
      render json: 'Calendar could not be created'
    end
  end

  private

  def fetch_calendar_params
    @calendar_params = params.permit(:title)
  end
end
