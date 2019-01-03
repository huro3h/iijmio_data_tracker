# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
      resources :packets
      root to: "packets#index"
    end
  root to: "packets#index"
  get 'packets/execute', to: 'packets#execute'
end
