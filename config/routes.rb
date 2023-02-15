Rails.application.routes.draw do

  post 'login' => 'auth#login'
  get 'users', to: 'users#index'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show'
  put 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  get 'articles', to: 'articles#index'
  post 'articles', to: 'articles#create'
  get 'articles/:id', to: 'articles#show'
  put 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
