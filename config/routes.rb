Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
  	resources :items, only: [:create, :destroy]
  	put '/items/:id' => 'items#toggle_complete'
  end

  root to: 'home#index'

  get 'about' => 'home#about'

end
