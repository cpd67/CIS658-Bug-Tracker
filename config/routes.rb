Rails.application.routes.draw do
  get 'home/index'
  get 'bugs/index'
  root 'home#index'

  resources :users
  resources :bugs
end
