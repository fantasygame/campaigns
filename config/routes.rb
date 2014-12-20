Rails.application.routes.draw do
  resources :campaigns do
    resources :games, except: [:index] do
      resources :posts, only: [:new, :edit, :create, :update, :destroy] do
        member do
          get :vote
        end
      end
    end
    member do
      get :toggle_membership
      get :show_posts
    end
  end

  root to: 'campaigns#index'
  devise_for :users
end
