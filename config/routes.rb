Rails.application.routes.draw do
  resources :social_infos
  devise_for :users
  root to: 'home#index'
  get 'contact' => 'home#contact'

  get 'find_by_email' => 'home#find_by_email'
  get 'find_by_info' => 'home#find_by_info'
  post 'search_by_info' => 'permutators#search_by_info'

end
