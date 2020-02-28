Rails.application.routes.draw do
  get 'landing/index'
  get '/about', to: 'about#index'
  get '/card/:card_name', to: "cards#show"
  get '/expansions', to: 'expansions#index'
  get '/expansion/:expansion_name', to: 'expansions#show'

  resources :cards, except: :show
  resources :expansions, except: :show

  root 'landing#index'
end
