class StudiesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :show]
  before_action :set_study, only: [:edit, :update, :show, :destroy]

  def new
    @study = current_user.studies.new
  end

  def create
    @study = current_user.studies.new(study_params)
    if @study.save
      redirect_to room_path(current_user.room)
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
        redirect_to room_path(current_user.room)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to study_path(@study)
    end
  end

  def finish
  end

  def destroy
    if current_user == @study.user
      @study.destroy
      redirect_to user_path(current_user)
    else
      redirect_to study_path(@study)
    end
  end

  private
  def set_study
    @study = Study.find(params[:id])
  end

  def study_params
    params.require(:study).permit(:title, :goal, :content, :review)
  end
end
