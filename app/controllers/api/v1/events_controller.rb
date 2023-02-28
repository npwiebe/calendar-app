class Api::V1::EventsController < Api::V1::BaseController
  before_action :fetch_event_params

  def index
    @events = Events.where(user: @user, calendar: @calendar)
    render json: @events.to_json
  end

  def create
    @events = Events.create(title: @event_params[:title], details: @event_params[:details])
    render json: @events.to_json
  end

  private

  def fetch_event_params
    @event_params = params.permit(:title, :details)
  end

  def fetch_calendar
    @calendar = Calendar.find_by_id(params.permit(:calendar_id))
  end
end
