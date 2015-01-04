require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  constraints Monban::Constraints::SignedIn.new do
    root "homes#show", as: :home
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resources :dashboards, only: [:show]
  resources :images do
    resources :text_comments, only: [:create]
    resources :picture_comments, only: [:create]
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
