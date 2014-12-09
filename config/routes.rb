Rails.application.routes.draw do
  

  resources :campaigns do
    resources :games
  	member do
      get :join
  		get :resign
  	end
  end

  root to: 'visitors#index'
  devise_for :users
end
