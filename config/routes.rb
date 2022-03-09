Rails.application.routes.draw do
 resources :gadgets, only: %i[index show new create] do
    resources :bookings, only: [:index, :new, :create]
  end
  resources :bookings, only: [:show]

  devise_for :users
  root to: 'pages#home'
end
