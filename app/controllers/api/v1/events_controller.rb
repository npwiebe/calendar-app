class Api::V1::EventsController < Api::V1::BaseController
  before_action :fetch_events
  before_action :fetch_event, only: %i[create update show delete]

  def index
    render json: @events.to_json
  end

  def create
    @event.save!
    render json: @event.to_json
  end

  def update
    @event.save!
    render json: @event.to_json
  end

  def show
    render json: @event.to_json
  end

  def delete
    @event.destroy!
    render json: @event.to_json
  end

  private

  def fetch_events
    @calendar_id = params.permit(:calendar_id)
    @calendar = @user.calendars.find_by_id(params[:calendar_id]) if params[
      :calendar_id
    ]
    @events = @calendar.present? ? @calendar.events : @user.events
  end

  def fetch_event
    @event_params = params.permit(:id, :title, :details, :datetime)
    @event = @events.find_or_initialize_by(id: @event_params[:id])
    @event.assign_attributes(@event_params)
  end
end
