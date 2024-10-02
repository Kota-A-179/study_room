class Users::SessionsController < Devise::SessionsController
  def destroy
    room = current_user.room
    room_user_destroy
    room_id_destroy
    super
  end

  private
  def room_user_destroy
    ActionCable.server.broadcast "room_channel_#{room.id}", {
      action: 'remove',
      user_id: current_user.id
    }
  end

  def room_id_destroy
    current_user.update(room_id: nil)
    if room.users.count == 0
      room.destroy unless room.name == "1"
    end
  end

end
