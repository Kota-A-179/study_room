class StudiesController < ApplicationController
  def new
    @study = current_user.studies.new
    @room = Room.find(current_user.room_user.room_id)
  end
end
