class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  def render_response(data = {}, http_code = 200)
    render json: data, status: http_code
  end
end
