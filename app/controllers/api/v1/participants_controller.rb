class Api::V1::ParticipantsController < Api::V1::BaseController
  before_action :require_event
  before_action :fetch_participant_params, only: %i[create update]

  def index
    render json: @participants.to_json
  end

  def create
    @participant = @participants.create!(@participant_params)
    render json: @event.to_json
  end

  def update
    @participant = @participants.update(@participant_params)
    render json: @event.to_json
  end

  private

  def fetch_participant_params
    @participant_params =
      params.permit(:id, :participatable_type, :participatable_id, :role)
  end

  def require_event
    params.require(:event_id)
    @event = Event.find_by_id!(params[:event_id]) if params[:event_id]
    @participants = @event.participants
  end
end
