Rails.application.routes.draw do
  resources :gadgets, only: [:index]
  devise_for :users
  root to: 'pages#home'
end
