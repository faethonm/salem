Rails.application.routes.draw do
  resources :social_infos
  devise_for :users
  root 'home#index'
  get 'contact' => 'home#contact'
end
