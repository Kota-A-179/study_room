Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_scope :user do
    root to: 'users/sessions#new'
  end
  resources :rooms, only: [:create, :destroy] do
    resources :room_users, only: [:index]
  end
end
