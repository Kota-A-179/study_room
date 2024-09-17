class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @room = Room.find(@user.room_user.room_id)
    @studies = @user.studies
  end
end
