Rails.application.routes.draw do
  resources :gadgets, only: %i[index show]
  devise_for :users
  root to: 'pages#home'
end
