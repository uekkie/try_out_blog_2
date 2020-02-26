Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/registrations'
  }
  root to: "posts#index"
  resources :posts
end
