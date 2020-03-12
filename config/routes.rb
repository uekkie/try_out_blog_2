Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }
  root to: "posts#index"

  resources :posts, only: %i[index]
  
  resources :users, only: %i[index show edit update] do
    resources :posts, only: %i[show new create edit update destroy] do
      resources :likes, only: %i[create destroy], module: :posts
      resources :comments, only: %i[create]
    end
    get :following, :followers, on: :member
    resource :relationship, only: %i[create destroy]
  end

  scope module: :users do
    get "profile" 
  end


  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/lo'
  end
end
