Rails.application.routes.draw do
  resources :users
  resources :blogs

  post '/login', to: 'users#login'
end
