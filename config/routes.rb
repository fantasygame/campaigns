Rails.application.routes.draw do

  resources :campaigns do
    resources :games, except: [:index] do
      resources :posts, only: [:new, :edit, :create, :update, :destroy]
    end
  	member do
      get :toggle_membership
  	end
  end

  root to: 'visitors#index'
  devise_for :users
end
