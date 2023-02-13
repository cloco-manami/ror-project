Rails.application.routes.draw do
  get 'users/index'
  get 'users/create'
  get 'users/show'
  get 'users/update'
  get 'users/destroy'

  get 'articles', to: 'articles#index'
  post 'articles', to: 'articles#create'
  get 'articles/:id', to: 'articles#show'
  put 'articles/:id', to: 'articles#update'
  delete 'articles/:id', to: 'articles#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
