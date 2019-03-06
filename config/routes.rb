Rails.application.routes.draw do
  root to: 'logins#index'

  resources :logins
  get 'login_status', to: 'login_status#index'
  resources :sessions, only: [:new, :create, :destroy]

  get 'sign_in', to: 'sessions#new', as: 'sign_in'
  get 'sign_out', to: 'sessions#destroy', as: 'sign_out'
end
