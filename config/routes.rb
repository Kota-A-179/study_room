Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
  resources :rooms, only: [:create, :destroy] do
    resources :room_users, only: [:index]
  end
end
