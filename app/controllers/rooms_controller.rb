class RoomsController < ApplicationController
  before_action :authenticate_user!, only: :show
  def show
    @room = Room.find(params[:id]).includes(:users)
    @rooms = Room.all
  end
end