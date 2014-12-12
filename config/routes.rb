Rails.application.routes.draw do

  resources :campaigns do
    resources :games do
      resources :posts
    end
  	member do
      get :toggle_membership
  	end
  end

  root to: 'visitors#index'
  devise_for :users
end
