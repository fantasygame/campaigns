Rails.application.routes.draw do
  root to: 'campaigns#index'

  resources :campaigns do
    resources :games, except: [:index] do
      resources :posts, only: [:new, :edit, :create, :update, :destroy] do
        member do
          get :vote
        end
      end
    end
    resources :rewards
    member do
      get :toggle_membership
      get :show_posts
    end
  end

  devise_for :users
  resources :users, only: [:index, :show]
end
