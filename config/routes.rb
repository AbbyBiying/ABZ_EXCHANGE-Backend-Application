require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resource :about, only: [:show]

  resources :images do
    resources :text_comments, only: [:create]
    resources :picture_comments, only: [:create]
  end

  resources :listings do
    resources :offers, except: [:index, :show]
  end

  resources :offers, only: [] do
    member do
      post "accept" => "accept_trades#create"
    end
  end

  resources :trades, only: [:show] do
    member do
      post "complete" => "complete_trades#create"
    end
  end

  resources :comments, only: [:create]
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
