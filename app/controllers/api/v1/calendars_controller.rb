class Api::V1::CalendarsController < Api::V1::BaseController
  before_action :fetch_calendars
  before_action :fetch_calendar, only: %i[create update show delete]

  def index
    render json: @calendars.to_json
  end

  def create
    @calendar.save!
    render json: @calendar.to_json
  end

  def update
    @calendar.save!
    render json: @calendar.to_json
  end

  def show
    render json: @calendar.to_json
  end

  def delete
    @calendar.destroy!
    render json: @calendar.to_json
  end

  private

  def fetch_calendars
    @calendars = @user.calendars
  end

  def fetch_calendar
    @calendar_params = params.permit(:id, :title, :details)
    @calendar = @user.calendars.find_or_initialize_by(id: @calendar_params[:id])
    @calendar.assign_attributes(@calendar_params)
  end
end
