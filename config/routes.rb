# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'customer_requests#new'
  resource :customer_requests, only: %i(new create)
  get '/customer_requests', to: 'customer_requests#new'
  get '/thank_you', to: 'pages#thank_you'
end
