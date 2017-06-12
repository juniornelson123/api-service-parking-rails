Rails.application.routes.draw do
  #devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
  	resources :parkings
  	post 'parkings/:parking_id/vagancy' => 'parkings#add_vagancies'

  	resources :users

  	get 'vagancies/parking/:parking_id' => 'vagancies#index' 
  	get 'vagancies/:id' => 'vagancies#show'
  	post 'vagancies' => 'vagancies#create'
  	put 'vagancies/:id' => 'vagancies#update'
  	delete 'vagancies/:id' => 'vagancies#destroy'

  	post '/sign_in' => 'sessions#sign_in'
  	post '/sign_up' => 'sessions#sign_up'
  end
end
