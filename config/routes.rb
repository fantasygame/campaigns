Rails.application.routes.draw do
  resources :games

  resources :campaigns

  root to: 'visitors#index'
  devise_for :users
end
