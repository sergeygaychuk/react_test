class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  helper Webpacker::Helper
  rescue_from Exception do |exception|
    render json: { error: exception.message }, status: 500
  end
end
