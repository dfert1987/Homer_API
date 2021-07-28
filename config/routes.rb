Rails.application.routes.draw do
  resources :remarks
  resources :replies
  resources :comments
  resources :users
  resources :blogs

  post '/login', to: 'users#login'
  get '/profile', to: 'users#profile'
end
