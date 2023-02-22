class Api::V1::EventsController < Api::V1::BaseController
  def index
    @events = Events.where(user: @user)
    render json: @events.to_json
  end
end
