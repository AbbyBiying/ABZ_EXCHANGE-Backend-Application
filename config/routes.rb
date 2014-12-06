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
    resources :comments, only: [:create, :destroy]
  end

  resource :session, only: [:new, :create, :destroy]
  resources :users, except: [:destroy]
  resources :locations, only: [:new, :index, :show, :create]
end
