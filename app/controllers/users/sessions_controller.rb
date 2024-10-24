class Users::SessionsController < Devise::SessionsController

  def create
    super 
    @room = Room.left_outer_joins(:users).group("rooms.id").having("COUNT(users.id) < 10").first || Room.create(name: "#{Room.count + 1}")
    current_user.update(room_id: @room.id)
    cookies.encrypted[:user_id] = { value: current_user.id, expires: 1.hour.from_now }
    session[:room_id] = @room.id
    room_user_add
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
    if current_user.present?
      @room = current_user.room
      room_user_remove
      room_id_remove
    end
    super
  end

  

  private
  def room_user_add
    ActionCable.server.broadcast "room_channel_#{@room.id}", {
      action: 'addUser',
      user_id: current_user.id,
      user: render_to_string(partial: 'shared/room_user', locals: {room_user: current_user})
    }
  end

  def room_user_remove
    ActionCable.server.broadcast "room_channel_#{@room.id}", {
      action: 'removeUser',
      user_id: current_user.id
    }
  end

  def room_id_remove
    current_user.update(room_id: nil)
    if @room.users.count == 0 && @room.name != "1"
      Room.all.each do |room|
        ActionCable.server.broadcast "room_channel_#{room.id}", {
          action: 'removeRoom',
          room_id: @room.id
        }
      end
      @room.destroy
    end
  end

end
