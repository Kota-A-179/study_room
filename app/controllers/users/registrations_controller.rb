class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameter, only: [:create, :update]

  def create
    super
  end

  def after_sign_up_path_for(resource)
    cookies.encrypted[:user_id] = { value: resource.id, expires: 1.hour.from_now }
    if resource.room
      room_path(resource.room)
    else
      root_path
    end
  end

  def update
    if current_user.update(user_params)  
      update_room_user
      redirect_to user_path(current_user)
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  private
  def configure_permitted_parameter
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :status_id, :occupation_id, :icon_id, :goal, :birthday])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :status_id, :occupation_id, :icon_id, :goal, :birthday])
  end

  def user_params  
    params.require(:user).permit(:nickname, :status_id, :occupation_id, :icon_id, :goal, :birthday)
  end

end
