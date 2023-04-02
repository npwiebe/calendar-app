class Api::V1::CalendarsController < Api::V1::BaseController
  before_action :fetch_calendars
  before_action :fetch_calendar_params, only: %i[create update]

  def index
    render json: @calendars.to_json
  end

  def create
    begin
      @calendar = @user.calendars.create!(@calendar_params)
      render json: @calendar.to_json
    rescue => e
      render json: "Calendar could not be created"
    end
  end

  private

  def fetch_calendar_params
    @calendar_params = params.permit(:title)
  end

  def fetch_calendars
    @calendars = @user.calendars
  end
end
