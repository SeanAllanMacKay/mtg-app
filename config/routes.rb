Rails.application.routes.draw do
  get 'landing/index'
  get '/about', to: 'about#index'
  get '/card/:name', to: "cards#show"

  resources :cards, except: :show

  root 'landing#index'
end
