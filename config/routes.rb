# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users
  root 'sessions#new', as: 'home'
  get 'palindroms/index', as: 'form'
  post 'palindroms/result', to: 'palindroms#result'
  get 'sessions/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'users/index', as: 'all'
end