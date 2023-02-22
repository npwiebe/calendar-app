class Api::V1::BaseController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :authenticate_from_key

  private

  def authenticate_from_key
    @api_key = authenticate_with_http_token { |token| ApiKey.find_by_id(token) }
    @user = @api_key.user
  end
end
