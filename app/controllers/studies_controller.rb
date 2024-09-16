class StudiesController < ApplicationController
  before_action :set_room

  def new
    @study = current_user.studies.new
  end

  def create
    @study = current_user.studies.new(study_params)
    if @study.save
      redirect_to room_room_users_path(@room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @study = current_user.studies.last
  end

  def update
    @study = Study.find(params[:id])
    if @study.update(study_params)
      redirect_to room_room_users_path(@room)
    else
      render :edit, status: :unprocessable_entity
    end
  end
  private
  def set_room
    @room = Room.find(current_user.room_user.room_id)
  end

  def study_params
    params.require(:study).permit(:title, :goal, :content, :review)
  end
end
