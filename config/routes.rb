Rails.application.routes.draw do
 resources :gadgets, only: %i[index show new create] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:show]

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
