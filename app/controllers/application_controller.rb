class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?
  
  protected
  def after_sign_in_path_for(resource)
    rooms_path(resource)
  end
  
  def after_sign_up_path_for(resource)
    rooms_path(resource)
  end

  private
  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :status_id, :occupation_id, :icon_id, :birthday])
  end
end
