Rails.application.routes.draw do
 resources :gadgets, only: %i[index show new create] do
    resources :bookings, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
end
