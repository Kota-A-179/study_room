class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @room = Room.find(@user.room_user.room_id)
    @studies = @user.studies
  end
end
