Rails.application.routes.draw do
  resources :games

  resources :campaigns do
  	member do
  		get :join
  	end
  end

  # get 'campaigns/:id/join', 'campaigns#join'

  root to: 'campaigns#index'
  devise_for :users
end
