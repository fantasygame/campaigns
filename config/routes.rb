Rails.application.routes.draw do
  root to: 'campaigns#index'

  resources :campaigns do
    resources :heroes
    resources :games, except: [:index] do
      resources :posts, only: [:new, :edit, :create, :update, :destroy] do
        member do
          get :vote
        end
      end
    end
    resources :rewards do
      member do
        get :purchase
      end
    end
    member do
      get :toggle_membership
      get :show_posts
    end
  end

  resources :purchases, only: [] do
    member do
      get :toggle_used
    end
  end

  devise_for :users
  resources :users, only: [:index, :show]
end
