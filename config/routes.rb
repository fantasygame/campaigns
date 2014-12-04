Rails.application.routes.draw do
  resources :games

  resources :campaigns do
  	member do
  		get :join
  	end
  end

  root to: 'visitors#index'
  devise_for :users
end
