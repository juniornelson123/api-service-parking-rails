Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	resources :parkings
  	resources :users

  	post '/sign_in' => 'sessions#sign_in'
  	post '/sign_up' => 'sessions#sign_up'
  end
end
