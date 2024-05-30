Rails.application.routes.draw do
  get 'reactions/create'
  get 'reactions/destroy'
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  resources :users, only: [:show] do
    member do
      get :followings, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :index, :show]

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
    resources :reactions, only: [:create, :destroy]
  end

  resources :players, only: [:index, :show] do
    post 'coorde', on: :collection
  end
end
  
  root 'tweets#index'
end
