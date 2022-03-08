Rails.application.routes.draw do
 resources :gadgets, only: %i[index show] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show]
  devise_for :users
  root to: 'pages#home'
end
