Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "posts#index"

  resources :posts, only: [:index]
  
  resources :user do
    resources :posts
  end
end
