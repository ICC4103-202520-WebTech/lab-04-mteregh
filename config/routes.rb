Rails.application.routes.draw do
  resources :rooms,        only: [:index, :show]
  resources :guests,       only: [:index, :show]
  resources :reservations, only: [:index, :show]
  resources :services,     only: [:index, :show]


  get "up" => "rails/health#show", as: :rails_health_check


  root "rooms#index"
end
