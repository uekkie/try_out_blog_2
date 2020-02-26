Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "posts#index"

  resources :posts, only: %i[index]
  
  resources :users, only: %i[edit update] do
    resources :posts
  end

  scope module: :users do
    get "profile" 
  end

end
