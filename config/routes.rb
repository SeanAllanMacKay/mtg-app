Rails.application.routes.draw do
  get 'landing/index'

  resources :cards

  root 'landing#index'
end
