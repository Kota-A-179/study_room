class RoomsController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @room = Room.find(params[:id])
    @rooms = Room.all
    @users = @room.users.includes(:studies)
    @study = current_user.studies.last 

    respond_to do |format|
      format.html
      format.turbo_stream { render partial: 'room_users', locals: { users: @users } } if turbo_frame_request?
    end
  end
end