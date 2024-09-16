class StudiesController < ApplicationController
  def new
    @study = current_user.studies.new
  end
end
