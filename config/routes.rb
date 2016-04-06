Rails.application.routes.draw do
  resources :contacts
  devise_for :users
  root to: 'home#index'


  resources :umims do
    member do
      post :fullcontact_information_received
    end
  end

end
