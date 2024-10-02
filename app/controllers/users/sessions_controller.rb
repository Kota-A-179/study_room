class Users::SessionsController < Devise::SessionsController

  def create
    super
    room = room_search || Room.create(name: "#{Room.count + 1}")
    current_user.update(room_id: room.id)
    cookies.encrypted[:user_id] = { value: current_user.id, expires: 1.hour.from_now }
    session[:room_id] = room.id
  end
  
  def after_sign_in_path_for(resource)
    room_id = session[:room_id]
    if room_id.present?
      room_path(Room.find(room_id))
    else
      root_path
    end 
  end

  def destroy
    @room = current_user.room
    room_user_destroy
    room_id_destroy
    super
  end

  

  private
  def room_search
    Room.all.includes(:users).each do |room|
        return room if room.users.length < 10
    end
    return nil
  end

  def room_user_destroy
    ActionCable.server.broadcast "room_channel_#{@room.id}", {
      action: 'remove',
      user_id: current_user.id
    }
  end

  def room_id_destroy
    current_user.update(room_id: nil)
    if @room.users.count == 0
      @room.destroy unless @room.name == "1"
    end
  end

end
