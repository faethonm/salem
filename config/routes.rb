Rails.application.routes.draw do
  resources :contacts
  devise_for :users
  root to: 'home#index'

  resources :permutators

end
