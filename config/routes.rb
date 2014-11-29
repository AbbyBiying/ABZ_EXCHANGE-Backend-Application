require "monban/constraints/signed_in"
require "monban/constraints/signed_out"

Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :index]
  resources :images

  resources :images, only: [] do
    resources :comments, only:[:create, :destroy]
  end

  resources :locations, only: [:show, :create]
  resources :maps, only: [:show]

  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  constraints Monban::Constraints::SignedOut.new do
    root "sessions#new"
  end
end
