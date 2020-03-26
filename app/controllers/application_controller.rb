class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
  def render_not_found_response(exception)
    render json: { error: exception.message }, status: 404
  end
end
