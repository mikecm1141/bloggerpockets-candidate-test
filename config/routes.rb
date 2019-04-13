# frozen_string_literal: true

Rails.application.routes.draw do
  ## Limit routes to only the ones we are using.
  resources :posts, only: %i[index show] do
    get :comments, on: :member
  end

  ## Limit routes to only the ones we are using.
  resources :users, only: :show

  root to: "posts#index"
end
