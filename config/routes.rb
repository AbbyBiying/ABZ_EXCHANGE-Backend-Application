require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end

  resources :images do
    resources :text_comments, only: [:create]
    resources :picture_comments, only: [:create]
  end

  resources :offers do
    resources :counter_offers, only: [:create, :edit, :destroy]
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
