Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post 'user/:user_id/secret' => 'user#secret', as: 'user_secret'

  resources :family, only: [:index]
  resources :user, only: [:show]

end
