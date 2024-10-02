class ApplicationController < ActionController::Base
  before_action :basic_auth  
  before_action :configure_permitted_parameter, if: :devise_controller?
  protected
 
  
  def after_sign_up_path_for(resource)
    cookies.encrypted[:user_id] = { value: resource.id, expires: 1.hour.from_now }
    room_path(resource.room) 
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :status_id, :occupation_id, :icon_id, :goal, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :status_id, :occupation_id, :icon_id, :goal, :birthday])
  end
  
end
