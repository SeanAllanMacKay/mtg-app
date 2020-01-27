Rails.application.routes.draw do
  get 'landing/index'

  resources :cards, :formats

  root 'landing#index'
end
