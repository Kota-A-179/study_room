class RoomUsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @room = Room.find(params[:room_id])
    @rooms = Room.all
    @room_users = @room.room_users.includes(:user)
  end
end
