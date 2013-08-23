Watchr::Application.routes.draw do



  get "movies/show"

  get "movies/trailer"

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => 'home#index'
  resources :followings, :only => [:create, :destroy]
  resources :movies, :only => [:show] do
    member do
      get "trailer" => "movies#trailer"
    end
  end


end
