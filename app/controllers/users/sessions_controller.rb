class Users::SessionsController < Devise::SessionsController
  before_action :room_user_and_room_destroy, only: :destroy

  private
  def room_user_and_room_destroy
    room_user = current_user.room_user
    room = room_user.room
    room_user.destroy
    if room.room_users.count == 0
      room.destroy unless room.name == "Room1"
    end
  end

end
