Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show] do
  	resources :items, only: [:create, :destroy]
  end

  root to: 'home#index'

  get 'about' => 'home#about'

end
