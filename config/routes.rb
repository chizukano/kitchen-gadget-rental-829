Rails.application.routes.draw do
  resources :gadgets, only: %i[index show new create] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[show]

  # /user
  namespace :user do
    # .../bookings
    resources :bookings, only: [:index] do
      patch "approve", on: :member
      patch "reject", on: :member
    end
  end

  devise_for :users
  root to: 'pages#home'
end
