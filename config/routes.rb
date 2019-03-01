Rails.application.routes.draw do
  resources :logins

  root to: 'logins#index'
end
