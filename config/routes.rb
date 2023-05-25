Rails.application.routes.draw do

  devise_for :users

  #devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/bienvenida", to: "home#index"

  resources :users do
    get 'my_comments', on: :member
  end
  
  resources :users, only: [:update]
  get "perfil", to: "users#edit"
  delete '/users/:id', to: 'users#destroy', as: :delete_user

  # get '/users/:id', to: 'users#show', as: 'user_profile'

  root to: "home#index"

  resources :categories
  resources :articles do
    get "user/:user_id", to: "articles#from_author", on: :collection
    resources :comments, only: [:create, :destroy]
  end

  # resources :articles do
  #   resources :comments, only: [:create, :destroy]
  # end


  # get "articles", to:"articles#index"
  # get "articles/new", to: "articles#new", as: :new_articles
  # get "articles/:id", to: "articles#show"
  # get "articles/:id/edit", to: "articles#edit"
  # patch "/articles/:id", to: "articles#update", as: :article
  # post "articles", to: "articles#create"
  # delete "articles/:id", to: "articles#destroy"
end
