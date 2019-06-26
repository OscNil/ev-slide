Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    authenticated :user do
      root 'pages#profile', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :charging_sessions, only: [:create, :update]
  resources :queueings, only: [:read, :create, :update]

  # get "profile", to: 'pages#profile'
  get "queue", to: 'pages#queue'
  get "acdc", to: 'pages#acdc'
end
