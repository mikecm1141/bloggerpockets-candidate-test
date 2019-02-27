# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    get :comments, on: :member
  end

  resources :users

  root to: "posts#index"
end
