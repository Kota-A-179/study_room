Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'users/sessions#new'
  end
  resources :rooms, only: :show 
  resources :studies, except: :index do
    member do
      patch 'finish'
    end
  end
  resources :users, only: :show
  mount ActionCable.server => '/cable'
end
