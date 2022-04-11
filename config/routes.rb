Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  root to: 'articles#index'
  resources :articles
  devise_for :users
 root 'items#index'

 resources :items, only: [:index, :new, :create]
end