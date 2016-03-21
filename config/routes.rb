Rails.application.routes.draw do
  resources :social_infos
  devise_for :users
  root to: 'home#index'
  get 'contact' => 'home#contact'
end
