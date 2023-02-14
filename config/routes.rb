Rails.application.routes.draw do
  root 'arts#new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tops

  resources :users, only: [:show]
  resources :arts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
end
