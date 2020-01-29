Rails.application.routes.draw do
  get 'landing/index'
  get '/about', to: 'about#index'

  resources :cards

  root 'landing#index'
end
