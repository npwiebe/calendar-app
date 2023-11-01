class Api::V1::ParticipantsController < Api::V1::BaseController
  before_action :require_event
  before_action :fetch_participants
  before_action :fetch_participant, only: %i[create update show delete]

  def index
    render json: @participants.to_json
  end

  def create
    @participant.save!
    render json: @participant.to_json
  end

  def update
    @participant.save!
    render json: @participant.to_json
  end

  def show
    render json: @participant.to_json
  end

  def delete
    @participant.destroy!
    render json: @participant.to_json
  end

  private

  def require_event
    params.require(:event_id)
    @event = Event.find_by_id!(params[:event_id]) if params[:event_id]
  end

  def fetch_participants
    @participants = @event.participants
  end

  def fetch_participant
    @participant_params =
      params.permit(:id, :participatable_type, :participatable_id, :role)
    @participant =
      @participants.find_or_initialize_by(id: @participant_params[:id])
    @participant.assign_attributes(@participant_params)
  end
end
