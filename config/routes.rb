Rails.application.routes.draw do
  devise_for :users
 root 'items#index'

 resources :items

 resources :items do
  resources :customers, only: [:index, :create]
end

end