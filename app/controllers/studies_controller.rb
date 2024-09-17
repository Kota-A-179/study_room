class StudiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]
  before_action :set_room
  before_action :set_study, only: [:edit, :update, :show]

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

  def show
  end

  def edit
    unless current_user == @study.user
      redirect_to study_path(@study)
    end
  end

  def update
    if current_user == @study.user
      if @study.update(study_params)
        redirect_to room_room_users_path(@room)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to study_path(@study)
    end
  end

  def destroy
    if current_user == @study.user
      study = Study.find(params[:id])
      study.destroy
      redirect_to user_path(@study.user)
    else
      redirect_to study_path(@study)
    end
  end

  private
  def set_room
    @room = Room.find(current_user.room_user.room_id)
  end

  def set_study
    @study = Study.find(params[:id])
  end

  def study_params
    params.require(:study).permit(:title, :goal, :content, :review)
  end
end
