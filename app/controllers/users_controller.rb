class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @total_time = total_study_time
  end
  
  private
  def total_study_time
    return (@user.studies.sum(:study_time).to_f / 60).floor(1)
  end
end
