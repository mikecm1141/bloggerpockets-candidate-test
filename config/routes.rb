# frozen_string_literal: true

Rails.application.routes.draw do
  ## Limit routes to only the ones we are using.
  resources :posts, only: %i[index show] do
    ## Reconfigure the nested route to use a more conformed controller
    ## action method, so that we use the Comments controller to gather
    ## comments and not the Post controller via the custom action #comments.
    resources :comments, only: :index
  end

  ## Limit routes to only the ones we are using.
  resources :users, only: :show

  root to: "posts#index"
end
