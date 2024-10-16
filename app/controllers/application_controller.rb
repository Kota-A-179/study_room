class ApplicationController < ActionController::Base
  before_action :basic_auth  

  def update_room_user
    ActionCable.server.broadcast "room_channel_#{current_user.room.id}", {
          action: 'updateUser',
          user_id: current_user.id,
          html: render_to_string(partial: 'shared/room_user', locals: { user: current_user })
        }
  end

  private
  
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
