class ApplicationController < ActionController::API
  attr_reader :current_user

  protected

  def authenticate_user!
    header = request.headers['Authorization']
    token = header.split.last if header.present?

    begin
      decoded = JsonWebToken.decode(token)
      @current_user = User.find(decoded[:user_id])
    rescue StandardError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end
end
