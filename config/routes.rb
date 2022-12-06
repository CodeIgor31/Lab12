# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new', as: 'home'
  resource :session, only: %i[new create destroy]
  resources :users
  get 'palindroms/index', as: 'form'
  post 'palindroms/result', to: 'palindroms#result'
  get 'users/index', as: 'all'
end
