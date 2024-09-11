Rails.application.routes.draw do
  devise_for :users
  root to: "room_users#index"
end
