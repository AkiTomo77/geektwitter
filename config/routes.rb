Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

scope '(:locale)', locale: /#{I18n.available_locales.map(&:to_s).join('|')}/ do
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]

  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
  
  root 'tweets#index'
end
