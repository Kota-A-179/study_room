class RoomUserChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_user_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
