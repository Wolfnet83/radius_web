Rails.application.routes.draw do
  get 'logins/index'

  root to: 'logins#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
