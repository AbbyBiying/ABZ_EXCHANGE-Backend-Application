require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  constraints Monban::Constraints::SignedIn.new do
    root "dashboard#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resources :comments, except: [:edit, :show]

  resource :home, only: [:show]
  resources :images do
  end

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
  resource :session, only: [:new, :create, :destroy]
  resources :locations, only: [:new, :index, :show, :create]
  resources :users, except: [:destroy] do
    member do
      post "follow" => "follows#create"
      delete "follow" => "follows#destroy"
    end
  end
end
