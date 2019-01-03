# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :packets
      root to: "packets#index"
    end
  resources :packets, only: :index
  get 'packets/execute', to: 'packets#execute'

  root to: "packets#index"
end
