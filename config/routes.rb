Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations'}
  # devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  resources :users, except: [:destroy] do
    member do
      post "follow" => "follows#create"
      delete "follow" => "follows#destroy"
    end
  end

  root to: 'dashboard#index'

  resources :dashboard, only: [:index] 
  
  resources :comments, except: [:edit, :show]

  resource :home, only: [:show] 
  
  resources :images  
  
  resources :listings do
    resources :offers, except: [:index, :show]
  end

  resources :offers, only: [] do
    member do
      post "accept" => "accept_exchanges#create"
    end
  end

  resources :successful_exchanges, only: [:index]

  resources :exchanges, only: [:show] do
    member do
      post "complete" => "complete_exchanges#create"
    end
  end

  resources :groups

  resource :search, only: [:show]

  resources :locations, only: [:new, :index, :show, :create]
  
end
