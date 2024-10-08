class StudiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]
  before_action :set_study, only: [:edit, :update, :show, :destroy, :finish]

  def new
    @study = Study.new
  end

  def create
    @study = current_user.studies.new(study_params)
    if @study.save
      update_room_user
      redirect_to room_path(current_user.room)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
    unless current_user == @study.user
      redirect_to room_path(current_user)
    end
  end

  def update
    if current_user == @study.user
      if @study.update(study_params)
        update_room_user
        redirect_to room_path(current_user.room)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to room_path(current_user)
    end
  end

  def finish
    if current_user == @study.user
      if @study.update(study_finish_params)
        update_room_user
        redirect_to user_path(current_user)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to room_path(current_user)
    end
  end

  def destroy
    if current_user == @study.user
      @study.destroy
      update_room_user
      redirect_to user_path(current_user)
    else
      redirect_to room_path(current_user)
    end
  end

  private
  def set_study
    @study = Study.find(params[:id])
  end

  def study_params
    params.require(:study).permit(:title, :goal, :content, :review)
  end

  def study_finish_params
    params.require(:study).permit(:title, :goal, :study_time, :content, :review)
  end
end
