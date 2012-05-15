SimpleFeed::Application.routes.draw do

  root to: 'feeds#index'

  resources :sessions,   only:   [:create, :destroy, :new]
  resources :feeds,      only:   [:index, :show]
  resources :feed_items, except: [:index, :show], path: 'items'
  resources :users,      only:   [:create, :new]

  match 'signup' => 'users#new',        :as => :signup
  match 'login'  => 'sessions#new',     :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout

  namespace :api do
    resources :feeds, only: :show do
      collection do
        get :items
      end
      resources :feed_items, path: 'items', only: [:index, :create, :update]
    end
  end

end
