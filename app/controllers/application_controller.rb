class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameter, if: :devise_controller?
  
  protected
  def after_sign_in_path_for(resource)
    room_user_destroy
    @room = room_search || @room = Room.create(name: "#{Room.count + 1}")
    @room.room_users.create(user_id: current_user.id)
    room_room_users_path(room_id: @room.id) 
  end
  
  def after_sign_up_path_for(resource)
    @room = room_search || @room = Room.create(name: "#{Room.count + 1}")
    @room.room_users.create(user_id: resource.id)
    room_room_users_path(room_id: @room.id) 
  end

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :status_id, :occupation_id, :icon_id, :birthday])
  end
  
  def room_user_destroy
    RoomUser.where(user_id: current_user.id).destroy_all 
  end

  def room_search
    Room.all.includes(:room_users).each do |room|
        return room if room.room_users.length < 15
    end
    return nil
  end

end
