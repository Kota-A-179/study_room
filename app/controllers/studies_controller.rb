class StudiesController < ApplicationController
  def new
    @study = current_user.studies.new
    @room = Room.find(current_user.room_user.room_id)
  end

  def create
    @study = current_user.studies.new(study_params)
    @room = Room.find(current_user.room_user.room_id)
    if @study.save
      redirect_to room_room_users_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def study_params
    params.require(:study).permit(:title, :goal)
  end
end
