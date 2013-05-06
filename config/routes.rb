SimpleFeed::Application.routes.draw do

  root to: 'feeds#index'

  resources :sessions,   only:   [:create, :destroy, :new]
  resources :feeds,      only:   [:index, :show]
  resources :feed_items, except: [:index, :show], path: 'items' do
    resources :refeeds, only: :create
  end
  resources :users,      only:   [:create, :new]

  match 'signup' => 'users#new',        :as => :signup
  match 'login'  => 'sessions#new',     :as => :login
  match 'logout' => 'sessions#destroy', :as => :logout

  match '/auth/github/callback',    to: 'authentications#create', provider: 'github'
  match '/auth/twitter/callback',   to: 'authentications#create', provider: 'twitter'
  match '/auth/instagram/callback', to: 'authentications#create', provider: 'instagram'
  match '/auth/failure' => redirect {|env, request|
    request.flash[:error] = "Authentication error: #{request.params[:message].humanize}"
    '/'
  }

  namespace :api do
    resources :feeds, only: :show do
      collection do
        get :items
      end
      resources :feed_items, path: 'items', only: [:show, :index, :create, :update]
    end
  end

end
