Rails.application.routes.draw do
  get 'bugs/index'
  root 'bugs#index'

  resources :users
  resources :bugs
end
