Rails.application.routes.draw do
  devise_for :users
  
  # Defines the root path route ("/") to the flights index page
  root 'flights#index'

  resources :flights
  resources :bookings
  resources :airports

end
