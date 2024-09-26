class RoomsController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @room = Room.find(params[:id])
    @rooms = Room.all
    @users = @room.users.includes(:studies)
    @study = current_user.studies.last 
  end
end