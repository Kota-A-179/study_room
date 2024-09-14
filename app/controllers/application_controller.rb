class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameter, if: :devise_controller?
  
  protected
  def after_sign_in_path_for(resource)
    @room = room_search || @room = Room.create(name: "#{Room.count + 1}")
    @room.room_users.create(user_id: resource.id)
    room_room_users_path(room_id: @room.id) 
  end
  
  def after_sign_up_path_for(resource)
    @room = room_search || @room = Room.create(name: "#{Room.count + 1}")
    @room.room_users.create(user_id: resource.id)
    room_room_users_path(room_id: @room.id) 
  end

  private
  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :status_id, :occupation_id, :icon_id, :birthday])
  end

  def room_search
    Room.all.includes(:room_users).each do |room|
        return room if room.room_users.length < 12
    end
    return nil
  end

end
