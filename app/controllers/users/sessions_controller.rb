class Users::SessionsController < Devise::SessionsController
  before_action :room_id_destroy, only: :destroy

  private
  def room_id_destroy
    room = current_user.room
    user.update(room_id: nil)
    if room.users.count == 0
      room.destroy unless room.name == "1"
    end
  end

end
