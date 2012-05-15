SimpleFeed::Application.routes.draw do

  root to: 'feeds#index'

  resources :sessions,   only:   [:create, :destroy, :new]
  resources :feeds,      only:   [:index, :show]
  resources :feed_items, except: [:index, :show]
  resources :users,      only:   [:create, :new]

  match 'signup' => 'users#new',        :as => :signup
  match 'login'  => 'sessions#new',     :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout

  namespace :api do
    resources :feed_items, only: :index
    resources :feeds, only: :show do
      resources :feed_items, only: [:index, :create, :update]
    end
  end

end
