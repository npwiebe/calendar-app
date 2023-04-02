class Api::V1::EventsController < Api::V1::BaseController
  before_action :fetch_event_params, only: %i[create update]
  before_action :fetch_calendar_and_ownable

  def index
    render json: @events.to_json
  end

  def create
    @event = @events.create!(**@event_params, ownable: @ownable)
    render json: @event.to_json
  end

  def update
    @event = @events.update(**@event_params)
    render json: @event.to_json
  end

  private

  def fetch_event_params
    @event_params = params.permit(:id, :title, :details, :datetime)
  end

  def fetch_calendar_and_ownable
    params.permit(:calendar_id)
    @calendar = @user.calendars.find_by_id(params[:calendar_id]) if params[
      :calendar_id
    ]
    @ownable = @user
    @events = @calendar.present? ? @calendar.events : @user.events
  end
end
