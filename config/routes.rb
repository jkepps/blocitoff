Rails.application.routes.draw do

  # resources :users, only: :show, as: :user_profile

  get 'users/show' => 'users#show'

  devise_for :users

  root to: 'home#index'

  get 'about' => 'home#about'

end
