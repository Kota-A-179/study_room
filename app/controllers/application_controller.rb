class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    room_users_path
  end
end
