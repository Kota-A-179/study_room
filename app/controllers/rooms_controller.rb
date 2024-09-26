class RoomsController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @room = Room.find(params[:id])
    @rooms = Room.all
    @users = @room.users.includes(:studies)
    @study = current_user.studies.last 

    ActionCable.server.broadcast "room_channel_#{@room.id}", {
      user: render_to_string(partial: 'room_user', locals: {user: current_user})
    }
  end
end